//
//  ShippingViewController.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/18/22.
//

import UIKit

class ShippingViewController: UIViewController {
    private var addressTextView: UITextView!
    private let dataStore = ShippingDataStore()
    private var phoneTextField: UITextField!
    private let stripe_customer_id: String
    
    init(stripe_customer_id: String) {
        self.stripe_customer_id = stripe_customer_id
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        let shippingView = ShippingView(frame: self.view.frame)
        self.view = shippingView
        self.addressTextView = shippingView.addressField
        phoneTextField = shippingView.phoneField
        shippingView.nextButton.addTarget(self,
                          action: #selector(nextBtnPressed(sender:)),
                          for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shipping Address"
        addressTextView.becomeFirstResponder()
    }
    
    @objc private func nextBtnPressed(sender: UIButton) {
        if let button = sender as? SpinningButton {
            button.startSpinning()
            let shippingString = addressTextView.text ?? "address error"
            let phoneString = phoneTextField.text ?? "phone error"
            
            dataStore.getStoreItems(cartItems: Cart.shared,
                                    shippingStr: shippingString,
                                    phoneStr: phoneString,
                                    stripe_customer_id: stripe_customer_id) { success, error in
                if success {
                    let confirmationVC = ConfirmationViewController()
                    self.navigationController?.pushViewController(confirmationVC,
                                                                  animated: true)
                } else if let error = error {
                    button.stopSpinning()
                    BannerAlert.show(with: error)
                } else {
                    button.stopSpinning()
                    BannerAlert.showUnknownError(functionName: "placeOrder")
                }
            }
        }
    }
    
    
}
