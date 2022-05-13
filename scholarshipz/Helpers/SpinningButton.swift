//
//  SpinningButton.swift
//  lookbook
//
//  Created by Daniel Jones on 2/23/22.
//

import UIKit

class SpinningButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 33, weight: .semibold)
        layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
