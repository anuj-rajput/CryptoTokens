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
    override func loadView() {
        super.loadView()
        loadTableView()
        loadUI()
        configureLongPressGesture()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    private func loadUI() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.Strings.ShowHashButton, style: .plain, target: self, action: #selector(showHashButtonTapped))
    }
    
    private func loadData() {
        if let icons = FileManager.getIconsFromStub() {
            self.icons = icons
            tableView.reloadData()
        }
    }
    
    private func configureLongPressGesture() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture))
        longPressGesture.minimumPressDuration = Constants.Duration.longPressDuration
        longPressGesture.delegate = self
        tableView.addGestureRecognizer(longPressGesture)
    }
    
    // MARK: Actions
    @objc
    func showHashButtonTapped() {
        // TODO: Show hash in action controller
    }
    
    @objc
    func handleLongPressGesture(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let touchPoint = gestureRecognizer.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                presentDetailView(from: indexPath)
            }
        }
    }
    
    // MARK: Navigation
    func presentDetailView(from indexPath: IndexPath) {
        // TODO: Presenting Detail View Logic
        print(indexPath.row)
    }
}

