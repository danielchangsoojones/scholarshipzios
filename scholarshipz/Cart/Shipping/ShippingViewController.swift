//
//  ShippingViewController.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/18/22.
//

import UIKit

class ShippingViewController: UIViewController {
    private var addressTextView: UITextView!
    
    override func loadView() {
        super.loadView()
        let shippingView = ShippingView(frame: self.view.frame)
        self.view = shippingView
        self.addressTextView = shippingView.addressField
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addressTextView.becomeFirstResponder()
    }
}
