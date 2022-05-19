//
//  CartViewController.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/18/22.
//

import UIKit
import Stripe
import Parse

class CartViewController: UIViewController {
    private let selectedSize: String
    private var tableView: UITableView!
    var subtotalLabel: UILabel!
    var totalLabel: UILabel!
    var paymentSheet: PaymentSheet?
    private let dataStore = CartDataStore()
    
    init(selectedSize: String) {
        self.selectedSize = selectedSize
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        let cartView = CartView(frame: self.view.frame)
        self.view = cartView
        self.tableView = cartView.tableView
        self.totalLabel = cartView.totalLabel
        self.subtotalLabel = cartView.subtotalLabel
        cartView.orderBtn.addTarget(self,
                                    action: #selector(orderBtnPressed(sender:)),
                                    for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        title = "Cart"
        self.view.backgroundColor = .jaguarBlack
        setTableView()
        calculateTotal()
    }
    
    private func calculateTotal() {
        var total: Double = 0
        for storeItem in Cart.storeItems {
            total += storeItem.price
        }
        
        subtotalLabel.text = "Subtotal: " + total.toPrice
        totalLabel.text = "Total: " + total.toPrice
    }
    
    @objc private func orderBtnPressed(sender: UIButton) {
        
        
        dataStore.getEphemeralKey { stripeResult, error in
            if let stripeResult = stripeResult {
                STPAPIClient.shared.publishableKey = stripeResult.publishableKey
                var configuration = PaymentSheet.Configuration()
                configuration.merchantDisplayName = "GoAthlete"
                configuration.customer = .init(id: stripeResult.customerID, ephemeralKeySecret: stripeResult.ephemeralKey)
                // Set `allowsDelayedPaymentMethods` to true if your business can handle payment
                // methods that complete payment after a delay, like SEPA Debit and Sofort.
                configuration.allowsDelayedPaymentMethods = false
                
                self.paymentSheet = PaymentSheet(paymentIntentClientSecret: stripeResult.paymentIntent, configuration: configuration)
                
                // MARK: Start the checkout process
                self.paymentSheet?.present(from: self) { paymentResult in
                    // MARK: Handle the payment result
                    switch paymentResult {
                    case .completed:
                      print("Your order is confirmed")
                    case .canceled:
                      print("Canceled!")
                    case .failed(let error):
                      print("Payment failed: \(error)")
                    }
                  }
            } else if let error = error {
                BannerAlert.show(with: error)
            } else {
                BannerAlert.showUnknownError(functionName: "getEphemeralKey")
            }
        }
    }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: CartTableCell.self)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cart.storeItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let storeItem = Cart.storeItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CartTableCell.self)
        cell.nameLabel.text = storeItem.title
        cell.priceLabel.text = storeItem.price.toPrice
        cell.imgView.loadFromFile(storeItem.coverPhoto.photo)
        cell.removeButton.tag = indexPath.row
        cell.removeButton.addTarget(self,
                                    action: #selector(removeItem(sender:)),
                                    for: .touchUpInside)
        return cell
    }
    
    @objc private func removeItem(sender: UIButton) {
        Cart.storeItems.remove(at: sender.tag)
        calculateTotal()
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
