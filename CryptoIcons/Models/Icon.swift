//
//  Icon.swift
//  CryptoIcons
//
//  Created by Anuj Rajput on 22/08/19.
//  Copyright © 2019 Matic Network. All rights reserved.
//

import Foundation

struct Icon {
    let name: String
    let script: String
    let symbol: String
}

extension Icon: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case script = "subscript"
        case symbol
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        script = try values.decode(String.self, forKey: .script)
        symbol = try values.decode(String.self, forKey: .symbol)
    }
}
