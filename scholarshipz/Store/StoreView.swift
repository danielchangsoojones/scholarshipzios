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
        self.backgroundColor = .blackBackground
        createTopBanner()
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createTopBanner() {
        bannerImgView.contentMode = .scaleAspectFill
        bannerImgView.clipsToBounds = true
        addSubview(bannerImgView)
        bannerImgView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        let backgroundBlur = UIView()
        backgroundBlur.backgroundColor = UIColor.blackBackground.withAlphaComponent(0.3)
        bannerImgView.addSubview(backgroundBlur)
        
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        bannerImgView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(5)
        }
        
        backgroundBlur.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(nameLabel).offset(-5)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(bannerImgView.snp.bottom)
        }
    }
}
