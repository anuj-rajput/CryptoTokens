//
//  DetailViewController.swift
//  CryptoIcons
//
//  Created by Anuj Rajput on 23/08/19.
//  Copyright © 2019 Matic Network. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: UI Outlets
    @IBOutlet var symbolImageView: UIImageView!
    @IBOutlet var currencyNameLabel: UILabel!
    @IBOutlet var currencyCodeLabel: UILabel!
    
    // MARK: Data
    var icon: Icon!
    
    // MARK: Initializer
    func configure(with icon: Icon) {
        self.icon = icon
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: View Hierarchy
    override func loadView() {
        super.loadView()
        symbolImageView.image = UIImage(named: self.icon.symbol)
        currencyNameLabel.text = self.icon.name
        currencyCodeLabel.text = self.icon.script.uppercased()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
