//
//  HomeViewController.swift
//  CryptoIcons
//
//  Created by Anuj Rajput on 22/08/19.
//  Copyright © 2019 Matic Network. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: UI Outlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: Data
    var icons: [Icon]?
    
    // MARK: Initializer
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: View Hierarchy
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableView()
        loadData()
    }
    
    // MARK: Private Methods
    private func loadTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.ReuseIdentifiers.HomeTableViewCell)
    }
    
    private func loadData() {
        if let icons = FileManager.getIconsFromStub() {
            self.icons = icons
            tableView.reloadData()
        }
    }
}

