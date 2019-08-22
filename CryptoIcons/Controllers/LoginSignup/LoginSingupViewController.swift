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
    
    private func signIn(username: String, password: String) {
        guard username.count > 0, password.count > 0 else { return }
        let keychain = SecureStore(secureStoreQueryable: GenericPasswordQueryable(service: KeychainConfiguration.serviceName))

        switch viewType {
        case .login:
            do {
                if let pass = try keychain.getValue(for: username) {
                    if pass == password {
                        presentHomeScene()
                    } else {
                        showAlert(title: Constants.Strings.Error, description: Constants.Strings.UserPassNotFound)
                    }
                } 
            } catch (let error) {
                fatalError("Retrieving username and password failed with \(error.localizedDescription)")
            }
        case .signup:
            do {
                try keychain.setValue(password, for: username)
                presentHomeScene()
            } catch (let error) {
                fatalError("Saving username and password failed with \(error.localizedDescription)")
            }
            // TODO: Save encrypted credentials and hash in Keychain
        }
    }
    
    // MARK: Actions
    @IBAction func actionButtonTapped(_ sender: Any) {
        // Resign keyboard responder from textfields
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        signIn(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    // MARK: Navigation
    func presentHomeScene() {
        guard let homeScreen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as? HomeViewController else { return }
        self.navigationController?.pushViewController(homeScreen, animated: true)
    }
}
