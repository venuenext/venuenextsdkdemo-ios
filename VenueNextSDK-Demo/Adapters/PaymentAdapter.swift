//  Copyright © 2019 VenueNext, Inc. All rights reserved.
//

import Foundation
import os.log
import VNPayment
import BraintreeDropIn
import BraintreePaymentFlow

@objc class PaymentAdapter: NSObject, PaymentProcessable, PaymentMethodRepresentable {
    var cardType: String = ""
    var lastFour: String = ""
    var instrument: PaymentMethodInstrument = .creditCard
    var cardholderName: String? = ""
    var nonce: String = ""
    
    func processPayment(from viewController: UIViewController?, completion: @escaping (PaymentMethodRepresentable?, NSError?) -> Void) {
        VNPayment.shared.getPaymentToken() { (result) in
            switch result {
            case .success(let token):
                DispatchQueue.main.async {
                    let request =  BTDropInRequest()
                    request.paypalDisabled = true
                    request.vaultManager = true
                    let dropIn = BTDropInController(authorization: token, request: request) { (controller, result, error) in
                        
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
                        guard let nonce = result.paymentMethod?.nonce else {
                            let error = NSError(source: self, code: 404, userInfo: [NSLocalizedDescriptionKey: "Payment Method did not provide a nonce"])
                            completion(nil, error)
                            return
                        }
                        self.nonce = nonce
                        completion(self, nil)
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
