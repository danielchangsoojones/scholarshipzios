//
//  ShippingView.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/18/22.
//

import UIKit
import TextFieldEffects

class ShippingView: UIView {
    private let addressLabel = UILabel()
    let addressField = UITextView()
    let phoneField = HoshiTextField()
    let nextButton = SpinningButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .jaguarBlack
        setAddressLabel()
        setTextView()
        setPhoneField()
        setNextBtn()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAddressLabel() {
        addressLabel.textColor = .white
        addressLabel.text = "Enter Shipping Address:"
        addSubview(addressLabel)
        addressLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
        }
    }
    
    private func setTextView() {
        addSubview(addressField)
        addressField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(addressLabel.snp.bottom).offset(10)
            make.height.equalTo(100)
        }
    }
    
    private func setPhoneField() {
        phoneField.placeholder = "Enter Phone Number"
        phoneField.borderActiveColor = .white
        phoneField.borderInactiveColor = .white
        phoneField.placeholderColor = .white
        addSubview(phoneField)
        phoneField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(addressField)
            make.top.equalTo(addressField.snp.bottom).offset(5)
            make.height.equalTo(50)
        }
    }
    
    private func setNextBtn() {
        nextButton.setTitle("Place Order", for: .normal)
        addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(phoneField.snp.bottom).offset(10)
        }
    }
    
//    private func setStackView() {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.alignment = .fill
//        stackView.spacing = 5
//        stackView.distribution = .fillEqually
//        stackView.snp.makeConstraints { make in
//            make.leading.trailing.top.equalToSuperview()
//            make.bottom.equalTo(self.snp.centerY)
//        }
//
//        addressField.placeholder = "Street Address"
//        stackView.addArrangedSubview(addressField)
//    }
}
