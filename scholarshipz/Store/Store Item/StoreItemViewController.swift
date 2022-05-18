//
//  StoreItemViewController.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/17/22.
//

import UIKit

class StoreItemViewController: UIViewController {
    private let storeItem: StoreItemParse
    let bannerImgView: UIImageView!
    let nameLabel: UILabel!
    let descriptionLabel: UILabel!
    
    init(storeItem: StoreItemParse) {
        self.storeItem = storeItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        let storeView = StoreItemView(frame: self.view.frame)
        self.view = storeView
        
        
        
        
        self.collectionView = storeView.collectionView
        storeView.nameLabel.text = influencer.fullName
        storeView.bannerImgView.loadFromFile(influencer.bannerPhoto)
        setCollectionView()
    }
}
