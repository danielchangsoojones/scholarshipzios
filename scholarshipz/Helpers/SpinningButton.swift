//
//  SpinningButton.swift
//  lookbook
//
//  Created by Daniel Jones on 2/23/22.
//

import UIKit

class SpinningButton: UIButton {
    private let spinner = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSpinner()
        setTitle("", for: .disabled)
        backgroundColor = .babyPurple
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        layer.cornerRadius = 20
        
        let edgeInsets = UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14)
        if #available(iOS 15.0, *) {
            var filled = UIButton.Configuration.plain()
            filled.contentInsets = NSDirectionalEdgeInsets(top: edgeInsets.top,
                                                           leading: edgeInsets.left,
                                                           bottom: edgeInsets.bottom,
                                                           trailing: edgeInsets.right)
            configuration = filled
        } else {
            contentEdgeInsets = edgeInsets
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startSpinning() {
        spinner.startAnimating()
        isEnabled = false
    }
    
    func stopSpinning() {
        spinner.stopAnimating()
        isEnabled = true
    }
    
    private func setSpinner() {
        spinner.color = .white
        addSubview(spinner)
        spinner.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(100)
        }
    }
}
