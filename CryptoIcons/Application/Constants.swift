//
//  Constants.swift
//  CryptoIcons
//
//  Created by Anuj Rajput on 22/08/19.
//  Copyright © 2019 Matic Network. All rights reserved.
//

import Foundation

enum Constants {
    
    enum Strings {
        static let SectionHeader = NSLocalizedString("My Tokens", comment: "")
        static let ShowHashButton = NSLocalizedString("Show Hash", comment: "")
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
        static let icons = "icons"
    }
}
