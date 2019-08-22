//
//  LoginSignupViewController+Protocols.swift
//  CryptoIcons
//
//  Created by Anuj Rajput on 22/08/19.
//  Copyright © 2019 Matic Network. All rights reserved.
//

import UIKit

extension LoginSingupViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        }
        
        if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
            actionButtonTapped(textField)
        }
        
        return true
    }
}
