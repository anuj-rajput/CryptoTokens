//
//  FileManager.swift
//  CryptoTokens
//
//  Created by Anuj Rajput on 22/08/19.
//  Copyright © 2019 Matic Network. All rights reserved.
//

import Foundation

extension FileManager {
    
    static func getTokensFromStub() -> [Token]? {
        guard let fileURL = Bundle.main.url(forResource: Constants.Files.tokens, withExtension: "json") else { return nil }
        guard let data = try? Data(contentsOf: fileURL) else { return nil }
        
        let response = try? JSONDecoder().decode([Token].self, from: data)
        return response
    }
}
