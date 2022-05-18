//
//  CartViewController.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/18/22.
//

import UIKit

class CartViewController: UIViewController {
    private let selectedSize: String
    private var tableView: UITableView!
    var subtotalLabel: UILabel!
    var totalLabel: UILabel!
    
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
        self.totalLabel = cartView.totalLabel
        self.subtotalLabel = cartView.subtotalLabel
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
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    private func setTableView() {
        tableView = UITableView(frame: self.view.frame)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: CartTableCell.self)
        self.view.addSubview(tableView)
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
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
