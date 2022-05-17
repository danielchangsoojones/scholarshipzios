//
//  StoreDataStore.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/17/22.
//

import Foundation
import Parse

class StoreDataStore {
    func getStoreItems(for influencer: InfluencerParse, completion: @escaping ([StoreItemParse]) -> Void) {
        let parameters: [String: Any] = ["influencerID": influencer.objectId ?? ""]
        PFCloud.callFunction(inBackground: "getStoreItems", withParameters: parameters) { (result, error) in
            if let storeItems = result as? [StoreItemParse] {
                completion(storeItems)
            } else if let error = error {
                BannerAlert.show(with: error)
            } else {
                BannerAlert.showUnknownError(functionName: "getStoreItems")
            }
        }
    }
}
