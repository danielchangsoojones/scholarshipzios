//
//  StoreItemView.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/17/22.
//

import UIKit

class StoreITemView: UIView {
    let bannerImgView = UIImageView()
    let nameLabel = UILabel()
    private let bottomView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .jaguarBlack
        createTopImg()
        setCollectionView()
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
        
    }
    
    private func setNameLabel() {
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.equalToSuperview().inset(5)
        }
    }
    
    private func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(bannerImgView.snp.bottom)
        }
    }
}
