//
//  LoginSingupViewController.swift
//  CryptoIcons
//
//  Created by Anuj Rajput on 22/08/19.
//  Copyright © 2019 Matic Network. All rights reserved.
//

import UIKit

class LoginSingupViewController: UIViewController {

    // MARK: UI Outlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var actionButton: UIButton!
    
    // MARK: Data
    public enum ViewType {
        case login, signup
    }

    var viewType: ViewType = .login
    
    // MARK: Initializer
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public func configure(with type: ViewType) {
        self.viewType = type
    }
    
    // MARK: View Hierarchy
    override func loadView() {
        super.loadView()
        switch viewType {
        case .login:
            actionButton.setTitle(Constants.Strings.SignIn, for: .normal)
            self.title = Constants.Strings.SignIn
        case .signup:
            actionButton.setTitle(Constants.Strings.CreateAccount, for: .normal)
            self.title = Constants.Strings.CreateAccount
        }
        loadTextfields()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
    }
    
    // MARK: Private Methods
    private func loadTextfields() {
        usernameTextField.placeholder = Constants.Strings.Username
        usernameTextField.delegate = self
        
        passwordTextField.placeholder = Constants.Strings.Password
        passwordTextField.delegate = self
    }
    
    private func loadUI() {
        // Username field is selected when view is loaded
        usernameTextField.becomeFirstResponder()
    }
    
    // MARK: Actions
    @IBAction func actionButtonTapped(_ sender: Any) {
        switch viewType {
        case .login:
            // TODO: Implement login
            // TODO: Retrieve plain text credentials from Keychain
            break
        case .signup:
            // TODO: Implement signup
            // TODO: Save encrypted credentials and hash in Keychain
            break
        }
        presentHomeScene()
    }
    
    // MARK: Navigation
    func presentHomeScene() {
        guard let homeScreen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as? HomeViewController else { return }
        self.navigationController?.pushViewController(homeScreen, animated: true)
    }
}
