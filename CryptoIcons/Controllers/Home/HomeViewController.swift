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
        loadPreviewing()
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
    
    private func loadPreviewing() {
        registerForPreviewing(with: self, sourceView: tableView)
    }
    
    private func loadUI() {
        self.navigationItem.hidesBackButton = true
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
        do {
            let keychain = SecureStore(secureStoreQueryable: GenericPasswordQueryable(service: KeychainConfiguration.serviceName))
            guard let base64EncodedString = try keychain.getValue(for: Constants.Keys.keychainHash) else { return }
            let encryptedData: Data = Data(base64Encoded: base64EncodedString)!
            
            let aes = try AES(keyString: Constants.Keys.aesKey)
            let decryptedData: String = try aes.decrypt(encryptedData)
            let plainText = decryptedData.split(separator: ",")
            showAlert(title: Constants.Strings.Hash, description: "Encrypted base64: \(base64EncodedString)\nUsername: \(plainText[0])\nPassword: \(plainText[1])")
        } catch {
            print("Something went wrong: \(error)")
        }
    }
    
    @objc
    func handleLongPressGesture(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let touchPoint = gestureRecognizer.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                let vc = presentDetailScene(for: indexPath.row)
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    // MARK: Navigation
    func presentDetailScene(for index: Int) -> DetailViewController {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as? DetailViewController else {
            fatalError("Couldn't load detail view controller")
        }
        vc.configure(with: icons![index])
        return vc
    }
}

