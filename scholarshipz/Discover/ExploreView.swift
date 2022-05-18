//
//  HomeView.swift
//  lookbook
//
//  Created by Dan Kwun on 2/7/22.
//

import UIKit
import SnapKit

class ExploreView: UIView {
    private var titleLabel: UILabel!
    private var subTitleLabel: UILabel!
    var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .jaguarBlack
        setUpTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTableView() {
        tableView = UITableView()
        tableView.backgroundColor = .clear
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp_topMargin).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
