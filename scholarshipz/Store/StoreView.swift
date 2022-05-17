//
//  StoreView.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/17/22.
//

import UIKit

class StoreView: UIView {
    let bannerImgView = UIImageView()
    let nameLabel = UILabel()
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createTopBanner()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createTopBanner() {
        bannerImgView.contentMode = .scaleAspectFill
        bannerImgView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        let backgroundBlur = UIView()
        backgroundBlur.backgroundColor = UIColor.blackBackground.withAlphaComponent(0.3)
        bannerImgView.addSubview(backgroundBlur)
        backgroundBlur.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(98)
        }
        
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        backgroundBlur.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(5)
        }
    }
}
