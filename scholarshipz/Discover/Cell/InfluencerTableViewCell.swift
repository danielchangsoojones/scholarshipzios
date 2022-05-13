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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        setUpInfluencerPhoto()
        setUpChatButton()
        setUpInfluencerDescription()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
    }
    
    func set(imageFile: AnyObject?, name: String, messageCount: String) {
        nameLabel.text = name
        profileImageView.loadFromFile(imageFile)
    }
    
    private func setUpInfluencerPhoto() {
        profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.layer.cornerRadius = 30
        profileImageView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        let imageDimension = UIScreen.main.bounds.width - 40
        profileImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(imageDimension)
        }
    }
    
    private func setUpChatButton() {
        if #available(iOS 15.0, *) {
            var filled = UIButton.Configuration.filled()
            filled.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: -10, bottom: 14, trailing: 0)
            chatButton = SpinningButton(configuration: filled)
        } else {
            // Fallback on earlier versions
            chatButton = SpinningButton()
            chatButton.contentEdgeInsets = UIEdgeInsets(top: 14, left: -10, bottom: 14, right: 0)
        }
        
        chatButton.addTarget(self, action: #selector(chatButtonPressed), for: .touchUpInside)
        chatButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        chatButton.backgroundColor = .black
        chatButton.layer.cornerRadius = 24
        chatButton.layer.borderWidth = 3
        chatButton.layer.borderColor = UIColor.white.cgColor
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
            make.leading.equalToSuperview()
            make.top.equalTo(profileImageView.snp.bottom).offset(5)
        }
    }
}
