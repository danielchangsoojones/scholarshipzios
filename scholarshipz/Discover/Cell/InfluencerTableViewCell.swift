//
//  InfluencerTableViewCell.swift
//  lookbook
//
//  Created by Dan Kwun on 2/7/22.
//

import UIKit
import Reusable
import SnapKit

class InfluencerTableViewCell: UITableViewCell, Reusable {
    private var profileImageView: UIImageView!
    var chatButton: SpinningButton!
    var nameLabel: UILabel!
    var startChattingAction: (() -> Void)? = nil
    var backgroundBlur = UIView()
    
    private let profilePhotoHeight = Int(UIScreen.main.bounds.height * 0.7)
    private let widthInset: CGFloat = 5
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        setUpInfluencerPhoto()
        setUpChatButton()
        setUpInfluencerDescription()
        setBackgroundBlur()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
    }
    
    func set(imageFile: AnyObject?, name: String) {
        nameLabel.text = name
        profileImageView.loadFromFile(imageFile)
    }
    
    private func setUpInfluencerPhoto() {
        profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 30
        profileImageView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            //the height breaks if it isn't a whole number
            make.height.equalTo(profilePhotoHeight)
            make.leading.trailing.equalToSuperview().inset(widthInset)
        }
    }
    
    private func setUpChatButton() {
        let edgeInsets = UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14)
        if #available(iOS 15.0, *) {
            var filled = UIButton.Configuration.plain()
            filled.contentInsets = NSDirectionalEdgeInsets(top: edgeInsets.top,
                                                           leading: edgeInsets.left,
                                                           bottom: edgeInsets.bottom,
                                                           trailing: edgeInsets.right)
            chatButton = SpinningButton(configuration: filled)
        } else {
            // Fallback on earlier versions
            chatButton = SpinningButton()
            chatButton.contentEdgeInsets = edgeInsets
        }
        
        chatButton.addTarget(self, action: #selector(chatButtonPressed), for: .touchUpInside)
        chatButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        //TODO: add the gradient
        chatButton.backgroundColor = .lightPurple
        chatButton.setTitle("View Gear", for: .normal)
        contentView.addSubview(chatButton)
        chatButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(profileImageView.snp.bottom).inset(30)
        }
    }
    
    @objc private func chatButtonPressed() {
        startChattingAction?()
    }
    
    private func setUpInfluencerDescription() {
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(chatButton.snp.top).offset(-10)
        }
    }
    
    private func setBackgroundBlur() {
        //got this code from Figma
        let view = UIView()
        view.frame = CGRect(x: 0,
                            y: 0,
                            width: UIScreen.main.bounds.width,
                            height: CGFloat(profilePhotoHeight))
        view.backgroundColor = .clear

        let layer0 = CAGradientLayer()
        layer0.colors = [
          UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor,
          UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        ]

        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.86, c: -0.86, d: 0, tx: 0.93, ty: -0.24))
        layer0.bounds = view.bounds.insetBy(dx: -0.5 * view.bounds.size.width, dy: -0.5 * view.bounds.size.height)
        layer0.position = view.center
        view.layer.addSublayer(layer0)

        self.profileImageView.addSubview(view)
        view.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.height)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension UIView{
    func createGradientBlur() {
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [
//        UIColor.black.withAlphaComponent(0).cgColor,
//        UIColor.black.withAlphaComponent(1).cgColor]
//        let viewEffect = UIBlurEffect(style: .dark)
//        let effectView = UIVisualEffectView(effect: viewEffect)
//        effectView.frame = CGRect(x: self.bounds.origin.x, y: self.bounds.size.height, width: self.bounds.width, height: self.bounds.size.height)
//        gradientLayer.frame = effectView.bounds
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradientLayer.endPoint = CGPoint(x: 0.0 , y: 0.3)
//        effectView.autoresizingMask = [.flexibleHeight]
//        effectView.layer.mask = gradientLayer
//        effectView.isUserInteractionEnabled = false //Use this to pass touches under this blur effect
//        addSubview(effectView)
    }
}
