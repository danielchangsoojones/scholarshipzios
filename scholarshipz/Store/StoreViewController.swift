//
//  StoreViewController.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/17/22.
//

import UIKit

class StoreViewController: UIViewController {
    private var collectionView: UICollectionView!
    private let influencer: InfluencerParse
    
    init(influencer: InfluencerParse) {
        self.influencer = influencer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        let storeView = StoreView(frame: self.view.frame)
        self.collectionView = storeView.collectionView
        storeView.nameLabel.text = influencer.fullName
        storeView.bannerImgView.loadFromFile(influencer.bannerPhoto)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
