//
//  Constants.swift
//  CryptoTokens
//
//  Created by Anuj Rajput on 22/08/19.
//  Copyright © 2019 Matic Network. All rights reserved.
//

import Foundation

enum Constants {
    
    enum Strings {
        static let SectionHeader = NSLocalizedString("My Tokens", comment: "")
        static let ShowHashButton = NSLocalizedString("Show Hash", comment: "")
        static let Okay = NSLocalizedString("Okay", comment: "")
        static let NewAccount = NSLocalizedString("New Account", comment: "")
        static let SignIn = NSLocalizedString("Sign In", comment: "")
        static let CreateAccount = NSLocalizedString("Create Account", comment: "")
        static let Username = NSLocalizedString("Username", comment: "")
        static let Password = NSLocalizedString("Password", comment: "")
        static let Error = NSLocalizedString("Error", comment: "")
        static let UserPassNotFound = NSLocalizedString("Username/Password not found", comment: "")
        static let Hash = NSLocalizedString("Hash", comment: "")
    }
    
    enum Duration {
        static let longPressDuration = 1.0
    }
    
    enum ReuseIdentifiers {
        static let HomeTableViewCell = "HomeTableViewCell"
    }
    
    enum Errors {
        static let cellDequeue = NSLocalizedString("UITableViewCell couldn't be dequeued.", comment: "")
    }
    
    enum Files {
        static let tokens = "tokens"
    }
    
    enum Keys {
        static let aesKey = "FiugQTgPNwCWUY,VhfmM4cKXTLVFvHFe"
        static let keychainHash = "keychainHash"
    }
}

struct KeychainConfiguration {
    static let serviceName = "CryptoTokens"
}
