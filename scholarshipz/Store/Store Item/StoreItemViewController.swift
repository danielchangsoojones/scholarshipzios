//
//  StoreItemViewController.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/17/22.
//

import UIKit

class StoreItemViewController: UIViewController {
    private let storeItem: StoreItemParse
    var itemImgView: UIImageView!
    var nameLabel: UILabel!
    var descriptionLabel: UILabel!
    var sizeStackView = UIStackView()
    var priceLabel: UILabel!
    
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
        self.itemImgView = storeView.itemImgView
        self.nameLabel = storeView.nameLabel
        self.descriptionLabel = storeView.descriptionLabel
        self.priceLabel = storeView.priceLabel
        self.sizeStackView = storeView.sizeStackView
        
        nameLabel.text = storeItem.title
        descriptionLabel.text = storeItem.itemDescription
        priceLabel.text = storeItem.price.toPrice
        addSizes()
        storeView.cartBtn.addTarget(self,
                                    action: #selector(addToCart),
                                    for: .touchUpInside)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemImgView.loadFromFile(storeItem.coverPhoto.photo)
    }
    
    private func addSizes() {
        for (index, size) in storeItem.sizes.enumerated() {
            let isSelected = index == 0
            addSizeItemToStackView(isSelected: isSelected, title: size)
        }
    }
    
    private func addSizeItemToStackView(isSelected: Bool, title: String) {
        let diameter: CGFloat = 10
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: diameter, height: diameter))
        if !isSelected {
            button.layer.borderColor = UIColor.white.cgColor
        }
        button.layer.borderWidth = 1
        button.backgroundColor = isSelected ? .babyPurple : .clear
        button.layer.cornerRadius = diameter / 2.0
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,
                         action: #selector(sizeSelected(sender:)),
                         for: .touchUpInside)
        
        sizeStackView.addArrangedSubview(button)
    }
    
    @objc private func sizeSelected(sender: UIButton) {
        sender.backgroundColor = .babyPurple
        sender.layer.borderColor = .none
        
        for subview in sizeStackView.arrangedSubviews {
            if let button = subview as? UIButton {
                if button.titleLabel?.text != sender.titleLabel?.text {
                    button.backgroundColor = .clear
                    button.layer.borderColor = UIColor.white.cgColor
                }
            }
        }
    }
    
    @objc private func addToCart() {
        var selectedSize: String?
        for subview in sizeStackView.arrangedSubviews {
            if let button = subview as? UIButton, let title = button.titleLabel?.text, button.backgroundColor == .babyPurple {
                selectedSize = title
                break
            }
        }
        
        if let selectedSize = selectedSize {
            let cartVC = CartViewController(selectedSize: selectedSize)
            navigationController? .pushViewController(cartVC, animated: true)
        } else {
            BannerAlert.show(title: "Error",
                             subtitle: "Could not select size, please try to select a size again",
                             type: .error)
        }
    }
}
