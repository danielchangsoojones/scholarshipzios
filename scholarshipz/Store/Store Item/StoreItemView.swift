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
        bottomView.layer.cornerRadius = 10
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
    }
    
    private func setNameLabel() {
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        bottomView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().inset(5)
        }
    }
    
    private func setDescriptionLabel() {
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        descriptionLabel.numberOfLines = 3
        bottomView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.trailing.equalToSuperview().inset(5)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
    }
    
    private func setSizeLabel() {
        sizeLabel.textColor = .white
        sizeLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        sizeLabel.text = "Size"
        bottomView.addSubview(sizeLabel)
        sizeLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
        }
    }
    
    private func setSizeStackView() {
        bottomView.addSubview(sizeStackView)
        sizeStackView.axis = .horizontal
        sizeStackView.distribution = .equalCentering
        sizeStackView.spacing = 5
        sizeStackView.alignment = .center
        sizeStackView.snp.makeConstraints { make in
            make.leading.equalTo(sizeLabel)
            make.trailing.equalToSuperview()
            make.top.equalTo(sizeLabel.snp.bottom).offset(5)
        }
    }
}
