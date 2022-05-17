//
//  ExploreViewController.swift
//  lookbook
//
//  Created by Dan Kwun on 2/7/22.
//

import UIKit

class ExploreViewController: UIViewController {
    var tableView: UITableView!
    private var influencers: [InfluencerParse] = []
    private let dataStore = ExploreDataStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInfluencers()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 38))
        imageView.contentMode = .scaleAspectFit
        let logo = UIImage(named: "logo_name")
        imageView.image = logo
        self.navigationItem.titleView = imageView
    }
    
    override func loadView() {
        super.loadView()
        let exploreView = ExploreView(frame: self.view.frame)
        self.view = exploreView
        self.tableView = exploreView.tableView
        setup(exploreView.tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func setup(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: InfluencerTableViewCell.self)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    private func loadInfluencers() {
        dataStore.getAllInfluencers { (influencers) in
            self.influencers = influencers
            self.tableView.reloadData()
        }
    }
}

extension ExploreViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return influencers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: InfluencerTableViewCell.self)
        let influencer = influencers[indexPath.row]
        cell.selectionStyle = .none
        cell.set(imageFile: influencer.discoverPhoto,
                 name: influencer.fullName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let influencer = influencers[indexPath.row]
        print("hi")
    }
}
