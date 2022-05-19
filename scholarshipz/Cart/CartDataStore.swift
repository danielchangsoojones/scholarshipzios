//
//  CartDataStore.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/18/22.
//

import Foundation
import Parse
import SwiftyJSON

struct StripeResult {
    let paymentIntent: String
    let ephemeralKey: String
    let publishableKey: String
    let customerID: String
}

class CartDataStore {
    func getEphemeralKey(completion: @escaping (StripeResult?, Error?) -> Void) {
        let parameters: [String: Any] = ["amount_in_cents": 2019]
        PFCloud.callFunction(inBackground: "getStripeEphemeralKey", withParameters: parameters) { (result, error) in
            if let result = result {
                let json = JSON(result)
                let paymentIntent = json["paymentIntent"].stringValue
                let ephemeralKey = json["ephemeralKey"].stringValue
                let publishableKey = json["publishableKey"].stringValue
                let customerID = json["customer"].stringValue
                let result = StripeResult(paymentIntent: paymentIntent,
                                          ephemeralKey: ephemeralKey,
                                          publishableKey: publishableKey,
                                          customerID: customerID)
                completion(result, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
