//
//  StoreItemViewController.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/17/22.
//

import UIKit

class StoreItemViewController: UIViewController {
//    private let storeItem: StoreItemParse
    var itemImgView: UIImageView!
    var nameLabel: UILabel!
    var descriptionLabel: UILabel!
    var sizeStackView = UIStackView()
    
//    init(storeItem: StoreItemParse) {
//        self.storeItem = storeItem
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func loadView() {
        super.loadView()
        let storeView = StoreItemView(frame: self.view.frame)
        self.view = storeView
        self.itemImgView = storeView.itemImgView
        self.nameLabel = storeView.nameLabel
        self.descriptionLabel = storeView.descriptionLabel
        self.sizeStackView = storeView.sizeStackView
        
        nameLabel.text = "T-Shirt Example"
        descriptionLabel.text = "T-shirt description alksjdflksjkf slakdjflkasdf aslkjfdlkasf lsakjdflksaf lasjdflkasf lasjdflksa lsajdflks asljflks lsadjfkls sladjfklsa slkjfkls slkdjfkls aslfjklsfj"
        addSizes()
    }
    
    private func addSizes() {
        let arrayExample = ["XS", "S", "M", "L", "XL"]
        for (index, size) in arrayExample.enumerated() {
            let isSelected = index == 0
            addSizeItemToStackView(isSelected: isSelected, title: size)
        }
    }
    
    private func addSizeItemToStackView(isSelected: Bool, title: String) {
        let diameter: CGFloat = 10
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: diameter, height: diameter))
        if !isSelected {
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.borderWidth = 1
        }
        button.backgroundColor = isSelected ? .babyPurple : .clear
        button.layer.cornerRadius = diameter / 2.0
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        sizeStackView.addArrangedSubview(button)
    }
}
