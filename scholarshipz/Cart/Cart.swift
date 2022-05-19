//
//  Cart.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/18/22.
//

import Foundation

class Cart {
    let storeItem: StoreItemParse
    let selectedSize: String
    
    init(storeItem: StoreItemParse, selectedSize: String) {
        self.storeItem = storeItem
        self.selectedSize = selectedSize
    }
    
    static var shared: [Cart] = []
}
