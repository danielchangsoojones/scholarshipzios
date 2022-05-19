//
//  ShippingDataStore.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/18/22.
//

import Foundation
import Parse

class ShippingDataStore {
    func getStoreItems(cartItems: [Cart], shippingStr: String, phoneStr: String, stripe_customer_id: String, completion: @escaping (Bool, Error?) -> Void) {
        let storeItemIDs = cartItems.map { cartItem in
            return cartItem.storeItem.objectId ?? ""
        }
        
        let selectedSizes = cartItems.map { cartItem in
            return cartItem.selectedSize
        }
        
        let parameters: [String: Any] = ["storeItemIDs": storeItemIDs,
                                         "selectedSizes": selectedSizes,
                                         "shippingStr": shippingStr,
                                         "phoneStr": phoneStr,
                                         "stripe_customer_id": stripe_customer_id
        
        ]
        PFCloud.callFunction(inBackground: "placeOrder", withParameters: parameters) { (result, error) in
            let isSuccess = result != nil
            completion(isSuccess, error)
        }
    }
}
