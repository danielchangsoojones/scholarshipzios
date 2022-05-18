//
//  StoreItemView.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/17/22.
//

import UIKit

class StoreItemView: UIView {
    let bannerImgView = UIImageView()
    let nameLabel = UILabel()
    private let bottomView = UIView()
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .jaguarBlack
        createTopImg()
        setBottomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createTopImg() {
        bannerImgView.contentMode = .scaleAspectFill
        bannerImgView.clipsToBounds = true
        addSubview(bannerImgView)
        bannerImgView.snp.makeConstraints { make in
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
            make.top.equalTo(bannerImgView.snp.bottom)
        }
        
        setNameLabel()
        setDescriptionLabel()
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
        bottomView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.trailing.equalToSuperview().inset(5)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
    }
}
