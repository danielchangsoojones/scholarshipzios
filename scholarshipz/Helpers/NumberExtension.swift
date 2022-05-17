//
//  File.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/17/22.
//

import Foundation

extension Double {
    var toPrice: String {
        let price = String(format: "$%.02f", self)
        return price
    }
}
