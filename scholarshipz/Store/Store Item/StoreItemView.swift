//
//  StoreItemView.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/17/22.
//

import UIKit

class StoreItemView: UIView {
    let itemImgView = UIImageView()
    let nameLabel = UILabel()
    private let bottomView = UIView()
    let descriptionLabel = UILabel()
    let sizeLabel = UILabel()
    let sizeStackView = UIStackView()
    let priceLabel = UILabel()
    let cartBtn = SpinningButton()
    
    private let horizontalInset: CGFloat = 10
    private let verticalOffset: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        createTopImg()
        setBottomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createTopImg() {
        itemImgView.contentMode = .scaleAspectFill
        itemImgView.clipsToBounds = true
        addSubview(itemImgView)
        itemImgView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
    }
    
    private func setBottomView() {
        bottomView.backgroundColor = .jaguarBlack
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 20
        bottomView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(itemImgView.snp.bottom)
        }
        
        setNameLabel()
        setDescriptionLabel()
        setSizeLabel()
        setSizeStackView()
        setPriceLabel()
        setCartBtn()
    }
    
    private func setNameLabel() {
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        bottomView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(horizontalInset)
            make.top.equalToSuperview().inset(verticalOffset)
        }
    }
    
    private func setDescriptionLabel() {
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        descriptionLabel.numberOfLines = 3
        bottomView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.trailing.equalToSuperview().inset(horizontalInset)
            make.top.equalTo(nameLabel.snp.bottom).offset(verticalOffset)
        }
    }
    
    private func setSizeLabel() {
        sizeLabel.textColor = .white
        sizeLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        sizeLabel.text = "Size"
        bottomView.addSubview(sizeLabel)
        sizeLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(verticalOffset)
        }
    }
    
    private func setSizeStackView() {
        bottomView.addSubview(sizeStackView)
        sizeStackView.axis = .horizontal
        sizeStackView.distribution = .fill
        sizeStackView.spacing = 35
        sizeStackView.alignment = .center
        sizeStackView.snp.makeConstraints { make in
            make.leading.equalTo(sizeLabel)
            make.top.equalTo(sizeLabel.snp.bottom).offset(verticalOffset)
        }
    }
    
    private func setPriceLabel() {
        priceLabel.textColor = .white
        priceLabel.font = .systemFont(ofSize: 20, weight: .medium)
        bottomView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    private func setCartBtn() {
        cartBtn.setTitle("Add to Cart", for: .normal)
        addSubview(cartBtn)
        cartBtn.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(horizontalInset)
            make.centerY.equalTo(priceLabel)
        }
    }
}
