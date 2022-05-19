//
//  CartTableCell.swift
//  scholarshipz
//
//  Created by Daniel Jones on 5/18/22.
//

import UIKit
import Reusable

class CartTableCell: UITableViewCell, Reusable {
    let imgView = UIImageView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let removeButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setImgView()
        setInfoStackView()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setImgView() {
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.backgroundColor = .white
        contentView.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.bottom.equalToSuperview().inset(10).priority(.medium)
            make.height.width.equalTo(100)
        }
    }
    
    private func setInfoStackView() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.alignment = .leading
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(imgView.snp.trailing).offset(5)
            make.trailing.equalToSuperview()
            make.top.bottom.equalTo(imgView)
        }
        
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        stackView.addArrangedSubview(nameLabel)
        
        priceLabel.textColor = .white
        priceLabel.font =  UIFont.systemFont(ofSize: 14, weight: .light)
        stackView.addArrangedSubview(priceLabel)
        
        removeButton.setTitleColor(.red, for: .normal)
        removeButton.setTitle("remove", for: .normal)
        removeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        stackView.addArrangedSubview(removeButton)
    }
}
