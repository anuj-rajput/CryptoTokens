//
//  UIViewController+Extension.swift
//  CryptoTokens
//
//  Created by Anuj Rajput on 22/08/19.
//  Copyright © 2019 Matic Network. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, description: String) {
        let alertControler = UIAlertController.init(title: title, message: description, preferredStyle: .alert)
        alertControler.addAction(UIAlertAction.init(title: Constants.Strings.Okay, style: .default, handler: { (action) in
            alertControler.dismiss(animated: true, completion: nil)
        }))
        self.present(alertControler, animated: true, completion: nil)
    }
}
