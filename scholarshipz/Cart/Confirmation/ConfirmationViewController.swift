//
//  ConfirmationViewController.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/18/22.
//

import UIKit

class ConfirmationViewController: UIViewController {
    private let titleLabel = UILabel()
    private let homeButton = SpinningButton()
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .jaguarBlack
        title = "Order Confirmation"
        setTitleLabel()
        setHomeBtn()
    }
    
    private func setTitleLabel() {
        titleLabel.text = "Thank you for your order #2869-59679. We will text you within 24 hours of your confirmation."
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    private func setHomeBtn() {
        homeButton.addTarget(self, action: #selector(homePressed), for: .touchUpInside)
        homeButton.setTitle("Return Home", for: .normal)
        self.view.addSubview(homeButton)
        homeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
    }
    
    @objc private func homePressed() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
