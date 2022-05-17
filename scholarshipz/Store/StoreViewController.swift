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
    private let dataStore = StoreDataStore()
    private var storeItems: [StoreItemParse] = []
    
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
        self.view = storeView
        self.collectionView = storeView.collectionView
        storeView.nameLabel.text = influencer.fullName
        storeView.bannerImgView.loadFromFile(influencer.bannerPhoto)
        setCollectionView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        loadStoreItems()
    }
    
    private func loadStoreItems() {
        dataStore.getStoreItems(for: influencer) { storeItems in
            self.storeItems = storeItems
            self.collectionView.reloadData()
        }
    }
}

extension StoreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: StoreItemCollectionCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size: CGFloat = (self.view.frame.size.width - space) / 2.0
        return CGSize(width: size, height: 250)
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let storeItem = storeItems[indexPath.row]
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: StoreItemCollectionCell.self)
        cell.imgView.loadFromFile(storeItem.coverPhoto.photo)
        cell.titleLabel.text = storeItem.title
        cell.priceLabel.text = storeItem.price.toPrice
        return cell
    }
}
