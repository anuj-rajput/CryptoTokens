//
//  LandingViewController.swift
//  CryptoIcons
//
//  Created by Anuj Rajput on 22/08/19.
//  Copyright © 2019 Matic Network. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    // MARK: UI Outlets
    @IBOutlet var buttons: [UIButton]!
    
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
        loadButtons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Private Methods
    func loadButtons() {
        for button in buttons {
            switch button.tag {
            case 1: button.setTitle(Constants.Strings.NewAccount, for: .normal)
            case 2: button.setTitle(Constants.Strings.SignIn, for: .normal)
            default: break
            }
        }
    }

    // MARK: Actions
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1: presentViewController(for: .signup)
        case 2: presentViewController(for: .login)
        default: break
        }
    }
    
    // MARK: Navigation
    func presentViewController(for viewType: LoginSingupViewController.ViewType) {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: LoginSingupViewController.self)) as? LoginSingupViewController else { return }
        viewController.configure(with: viewType)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
