//
//  StoreItemCollectionCell.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/17/22.
//

import UIKit
import Reusable

class StoreItemCollectionCell: UICollectionViewCell, Reusable {
    let imgView = UIImageView()
    let titleLabel = UILabel()
    let priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImgView()
        setTitleLabel()
        setPriceLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setImgView() {
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 20
        imgView.contentMode = .scaleAspectFill
        contentView.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(10)
            make.height.equalToSuperview().multipliedBy(0.75)
        }
    }
    
    private func setTitleLabel() {
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        titleLabel.textColor = .white
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(imgView)
            make.top.equalTo(imgView.snp.bottom).offset(5)
        }
    }
    
    private func setPriceLabel() {
        priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        priceLabel.textColor = .lightPurple
        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(imgView)
            make.top.equalTo(imgView.snp.bottom).offset(5)
        }
    }
}
