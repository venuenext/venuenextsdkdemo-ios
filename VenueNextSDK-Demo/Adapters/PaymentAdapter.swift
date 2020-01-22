//  Copyright © 2019 VenueNext, Inc. All rights reserved.
//

import Foundation
import os.log
import VNCore
import VNPayment
import BraintreeDropIn
import BraintreeApplePay // Import
import VNOrderData  // Import
import BraintreePaymentFlow

@objc class PaymentAdapter: NSObject, PaymentProcessable, PaymentMethodRepresentable {

    var cardType: String = ""
    var lastFour: String = ""
    var instrument: PaymentMethodInstrument = .creditCard
    var cardholderName: String? = ""
    var nonce: String = ""

    private var applePayError: NSError?

    private var braintreeApiClient: BTAPIClient?
    private var queue = OperationQueue()

    func processPayment(from viewController: UIViewController?, productType: ProductType, completion: @escaping (PaymentMethodRepresentable?, NSError?) -> Void) {
        VNPayment.shared.getPaymentToken() { (result) in
            switch result {
            case .success(let token):
                DispatchQueue.main.async {
                    let request =  BTDropInRequest()
                    request.paypalDisabled = true
                    request.vaultManager = true
                    let dropIn = BTDropInController(authorization: token, request: request) { [weak self] (controller, result, error) in

                        guard let self = self else { return }

                        defer {
                            controller.dismiss(animated: true, completion: nil)
                        }

                        guard error == nil else {
                            completion(nil , error as NSError?)
                            return
                        }

                        guard result?.isCancelled == false else {
                            completion(nil, nil)
                            return
                        }

                        guard let result = result else {
                            // Use the BTDropInResult properties to update your UI
                            completion(nil, nil)

                            return
                        }

                        // Handle Payment Types
                        switch result.paymentOptionType {

                        case .applePay:
                            self.applePayError = nil
                            self.braintreeApiClient = BTAPIClient(authorization: token)

                            self.queue.isSuspended = true
                            let blockOp = BlockOperation {
                                if let error = self.applePayError {
                                    completion(nil, error)
                                    return
                                }
                                self.instrument = .applePay
                                completion(self, nil)
                            }
                            self.queue.addOperation(blockOp)

                            guard let viewController = viewController else {
                                completion(nil, NSError(source: self, code: 422, userInfo: [NSLocalizedDescriptionKey: "PKPaymentAuthorizationViewController must be launched from a viewcontroller"]))
                                return
                            }

                            DispatchQueue.main.async { [weak self] in
                                self?.tappedApplePay(from: viewController, productType: productType, completion: completion)
                            }

                        default:
                            self.instrument = .creditCard
                            guard let nonce = result.paymentMethod?.nonce else {
                                let error = NSError(source: self, code: 404, userInfo: [NSLocalizedDescriptionKey: "Payment Method did not provide a nonce"])
                                completion(nil, error)
                                return
                            }

                            self.nonce = nonce
                            completion(self, nil)
                        }
                    }

                    viewController?.present(dropIn!, animated: true, completion: nil)
                }
            case .failure(let error):
                print(error.error.localizedDescription)
            }
        }
    }

    func postPaymentMethod(paymentMethod: PaymentMethodRepresentable, completion: @escaping ((NSError?) -> Void)) {
        print("postPaymentMethod: not implemented")
        completion(nil)
    }

    func defaultPaymentMethod(completion: @escaping ((PaymentMethodRepresentable?) -> Void)) {
        VNPayment.shared.getPaymentToken() { [weak self] (result) in
            switch result {
            case .success(let token):
                guard let btAPIClient = BTAPIClient(authorization: token) else {
                    completion(nil)
                    return
                }

                //Fetch the default payment method
                btAPIClient.fetchPaymentMethodNonces(true, completion: { (paymentMethods, error) in
                    guard let paymentMethod = paymentMethods?.first, paymentMethod.isDefault else {
                        completion(nil)
                        return
                    }

                    self?.nonce = paymentMethod.nonce
                    completion(self)
                })

            case .failure(let error):
                print(error.error.localizedDescription)
            }
        }
    }
}

extension PaymentAdapter: PKPaymentAuthorizationViewControllerDelegate {
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {

        self.applePayError = NSError(source: self, code: -1, userInfo: [NSLocalizedDescriptionKey : "User canceled ApplePay"])
        if self.queue.isSuspended {
            self.queue.isSuspended = false
        }

        controller.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController,
                                            didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {

        guard let braintreeApiClient = braintreeApiClient else {
            // Indicate failure via completion callback.
            completion(PKPaymentAuthorizationStatus.failure)
            return
        }


        let applePayClient = BTApplePayClient(apiClient: braintreeApiClient)
        applePayClient.tokenizeApplePay(payment) { [weak self] tokenizedApplePayPayment, error in
            guard let tokenizedApplePayPayment = tokenizedApplePayPayment else {
                // Tokenization failed. Check `error` for the cause of the failure.

                guard let self = self else { return }
                self.applePayError = error as NSError?
                // Indicate failure via completion callback.
                completion(PKPaymentAuthorizationStatus.failure)
                return
            }

            // Received a tokenized Apple Pay payment from Braintree.

            // Send the nonce to your server for processing.
            print("nonce = \(tokenizedApplePayPayment.nonce)")
            self?.nonce = tokenizedApplePayPayment.nonce
            self?.instrument = .applePay
            self?.queue.isSuspended = false
            // Then indicate success or failure via the completion callback, e.g.
            completion(PKPaymentAuthorizationStatus.success)

        }
    }


    func setupPaymentRequest(for productType: ProductType, completion: @escaping (PKPaymentRequest?, Error?) -> Void) {

        guard let braintreeApiClient = braintreeApiClient else {
            let error = NSError(source: self, code: 404, userInfo: [NSLocalizedDescriptionKey: "Could not setup Apple Pay payments because BTAPIClient is nil"])
            completion(nil, error)
            return
        }

        let applePayClient = BTApplePayClient(apiClient: braintreeApiClient)
        // You can use the following helper method to create a PKPaymentRequest which will set the `countryCode`,
        // `currencyCode`, `merchantIdentifier`, and `supportedNetworks` properties.
        // You can also create the PKPaymentRequest manually. Be aware that you'll need to keep these in
        // sync with the gateway settings if you go this route.
        applePayClient.paymentRequest { (paymentRequest, error) in
            guard let paymentRequest = paymentRequest else {
                completion(nil, error)
                return
            }
            // We recommend collecting billing address information, at minimum
            // billing postal code, and passing that billing postal code with all
            // Apple Pay transactions as a best practice.
            paymentRequest.requiredBillingContactFields = [.postalAddress]

            let paymentSummaryItems = VNOrderData.shared.cart.paymentSummaryItems(for: productType)

            // Set other PKPaymentRequest properties here
            paymentRequest.merchantCapabilities = .capability3DS
            paymentRequest.paymentSummaryItems = paymentSummaryItems

            completion(paymentRequest, nil)
        }
    }

    func tappedApplePay(from viewController: UIViewController, productType: ProductType, completion: @escaping (PaymentMethodRepresentable?, NSError?) -> Void) {

        self.setupPaymentRequest(for: productType) { (paymentRequest, error) in
            if let error = error {
                completion(nil, error as NSError)
                return
            }

            guard let request = paymentRequest else { return }
            // Example: Promote PKPaymentAuthorizationViewController to optional so that we can verify
            // that our paymentRequest is valid. Otherwise, an invalid paymentRequest would crash our app.
            if let vc = PKPaymentAuthorizationViewController(paymentRequest: request) as PKPaymentAuthorizationViewController? {
                vc.delegate = self
                viewController.present(vc, animated: true, completion: nil)

            } else {
                print("Error: Payment request is invalid.")
            }
        }
    }
}
