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
    private var tableView: UITableView!
    var subtotalLabel: UILabel!
    var totalLabel: UILabel!
    var paymentSheet: PaymentSheet?
    private let dataStore = CartDataStore()
    
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
    
    var totalAmount: Double {
        var total: Double = 0
        for cartItem in Cart.shared {
            total += cartItem.storeItem.price
        }
        return total
    }
    
    private func calculateTotal() {
        let total = totalAmount
        subtotalLabel.text = "Subtotal: " + total.toPrice
        totalLabel.text = "Total: " + total.toPrice
    }
    
    @objc private func orderBtnPressed(sender: UIButton) {
        dataStore.getEphemeralKey(amount: totalAmount) { stripeResult, error in
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
                        let shippingVC = ShippingViewController(stripe_customer_id: stripeResult.customerID)
                        self.navigationController?.pushViewController(shippingVC, animated: true)
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
        return Cart.shared.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let storeItem = Cart.shared[indexPath.row].storeItem
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
        Cart.shared.remove(at: sender.tag)
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
