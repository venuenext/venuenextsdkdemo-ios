//  Copyright © 2019 VenueNext, Inc. All rights reserved.
//

import Foundation
import os.log
import VNPayment

@objc class PaymentProcessor: NSObject, PaymentProcessable {
    func defaultPaymentMethod(completion: @escaping ((PaymentMethodRepresentable?) -> Void)) {
        VNPayment.shared.getPaymentToken() { (result) in
            switch result {
            case .success(let token):
                
                /* if you are using Braintree
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
                */
                
                let paymentMethod = BasicCard(
                    nonce: "fake-valid-nonce",
                    lastFour: "4242",
                    cardType: "Visa",
                    cardholderName: "Test User",
                    instrument: .creditCard
                )
                
                completion(paymentMethod)
                
            case .failure(let error):
                print(error.error.localizedDescription)
            }
        }
    }
    
    func processPayment(from viewController: UIViewController?, completion: @escaping (PaymentMethodRepresentable?, NSError?) -> Void) {
        VNPayment.shared.getPaymentToken() { result in
            switch result {
            case .success(_):

                let result = BasicCard(
                    nonce: "fake-valid-nonce",
                    lastFour: "4242",
                    cardType: "Visa",
                    cardholderName: "Test User",
                    instrument: .creditCard
                )

                completion(result, nil)
            case .failure(let error):
                completion(nil, error as NSError)
            }
        }
    }

    func postPaymentMethod(paymentMethod: PaymentMethodRepresentable, completion: @escaping ((NSError?) -> Void)) {
    }
}

class BasicCard: PaymentMethodRepresentable {
    var nonce: String
    var cardType: String
    var lastFour: String
    var cardholderName: String?
    var instrument: PaymentMethodInstrument

    init(nonce: String, lastFour: String, cardType: String, cardholderName: String, instrument: PaymentMethodInstrument) {
        self.nonce = nonce
        self.lastFour = lastFour
        self.cardholderName = cardholderName
        self.cardType = cardType
        self.instrument = instrument
    }
}
