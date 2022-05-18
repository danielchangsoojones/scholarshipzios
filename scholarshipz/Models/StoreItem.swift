//
//  StoreItem.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/17/22.
//

import Foundation
import Parse

class StoreItemParse: SuperParseObject, PFSubclassing {
    @NSManaged var price: Double
    @NSManaged var title: String
    @NSManaged var coverPhoto: StorePhotoParse
    @NSManaged var itemDescription: String
    @NSManaged var sizes: [String]
    
    class func parseClassName() -> String {
        return "StoreItem"
    }
}
