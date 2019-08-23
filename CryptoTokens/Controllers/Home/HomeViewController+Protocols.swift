//
//  HomeViewController+Protocols.swift
//  CryptoTokens
//
//  Created by Anuj Rajput on 22/08/19.
//  Copyright © 2019 Matic Network. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tokens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let token = tokens?[indexPath.row]
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: Constants.ReuseIdentifiers.HomeTableViewCell)
        cell.textLabel?.text = token?.name
        cell.detailTextLabel?.text = token?.script.uppercased()
        if let symbol = token?.symbol { cell.imageView?.image = UIImage(named: symbol) }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constants.Strings.SectionHeader
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = presentDetailScene(for: indexPath.row)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UIGestureRecognizerDelegate {
    
}

extension HomeViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let indexPath = tableView.indexPathForRow(at: location) {
            previewingContext.sourceRect = tableView.rectForRow(at: indexPath)
            return presentDetailScene(for: indexPath.row)
        }
        
        return nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
}
