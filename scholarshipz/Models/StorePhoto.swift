//
//  StorePhoto.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/17/22.
//

import Foundation
import Parse

class StorePhotoParse: SuperParseObject, PFSubclassing {
    @NSManaged var photo: PFFileObject
    @NSManaged var storeItem: StoreItemParse
    
    class func parseClassName() -> String {
        return "StorePhoto"
    }
}
