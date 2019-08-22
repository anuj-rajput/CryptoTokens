//
//  HomeViewController+Protocols.swift
//  CryptoIcons
//
//  Created by Anuj Rajput on 22/08/19.
//  Copyright © 2019 Matic Network. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let icon = icons?[indexPath.row]
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: Constants.ReuseIdentifiers.HomeTableViewCell)
        cell.textLabel?.text = icon?.name
        cell.detailTextLabel?.text = icon?.script.uppercased()
        if let symbol = icon?.symbol { cell.imageView?.image = UIImage(named: symbol) }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constants.Strings.SectionHeader
    }
}

extension HomeViewController: UIGestureRecognizerDelegate {
    
}
