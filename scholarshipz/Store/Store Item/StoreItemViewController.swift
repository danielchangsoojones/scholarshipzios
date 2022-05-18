//
//  StoreItemViewController.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/17/22.
//

import UIKit

class StoreItemViewController: UIViewController {
    private let storeItem: StoreItemParse
    
    init(storeItem: StoreItemParse) {
        self.storeItem = storeItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
