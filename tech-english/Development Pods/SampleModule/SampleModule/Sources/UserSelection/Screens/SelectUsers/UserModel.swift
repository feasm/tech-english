//
//  UserModel.swift
//  tech-english
//
//  Created by Felipe Alexander Da Silva Melo on 07/09/22.
//

import Foundation

class UserModel: Decodable {
    let name: String
    let description: String
    var isActivated: Bool
    
    init(name: String, description: String, isActivated: Bool) {
        self.name = name
        self.description = description
        self.isActivated = isActivated
    }
}
