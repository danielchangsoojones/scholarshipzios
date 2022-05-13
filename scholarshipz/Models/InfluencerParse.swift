//
//  InfluencerParse.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/13/22.
//

import Foundation
import Parse

class InfluencerParse: SuperParseObject, PFSubclassing {
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var discoverPhoto: PFFileObject?
    @NSManaged var bannerPhoto: PFFileObject?
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    class func parseClassName() -> String {
        return "Influencer"
    }
}
