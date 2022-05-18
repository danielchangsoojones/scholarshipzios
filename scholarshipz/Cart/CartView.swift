//
//  CartView.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/18/22.
//

import UIKit

class CartView: UIView {
    var tableView: UITableView!
    var bottomView = UIView()
    var subtotalLabel = UILabel()
    var totalLabel = UILabel()
    var orderBtn = SpinningButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setBottomView()
        setTableView()
        setOrderBtn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBottomView() {
        bottomView.backgroundColor = .clear
        addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height * 0.3)
        }
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.alignment = .leading

        subtotalLabel.textColor = .white
        stackView.addArrangedSubview(subtotalLabel)

        let shippingLabel = UILabel()
        shippingLabel.text = "Shipping: Free"
        shippingLabel.textColor = .white
        stackView.addArrangedSubview(shippingLabel)

        totalLabel.textColor = .white
        stackView.addArrangedSubview(totalLabel)

        bottomView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
    
    private func setOrderBtn() {
        orderBtn.setTitle("Place Order", for: .normal)
        bottomView.addSubview(orderBtn)
        orderBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    }
    
    private func setTableView() {
        tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.reloadData()
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top)
        }
    }
}
