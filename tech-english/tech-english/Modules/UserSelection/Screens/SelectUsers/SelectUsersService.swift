//
//  SelectUsersService.swift
//  tech-english
//
//  Created by Felipe Alexander Da Silva Melo on 07/09/22.
//

import Foundation

enum NetworkError: Error {
    case error
}

typealias GetUsersCompletion = (Result<[UserModel], NetworkError>) -> Void

protocol SelectUsersService {
    func getUsers(_ completion: @escaping GetUsersCompletion)
}

final class SelectUsersServiceMock: SelectUsersService {
    func getUsers(_ completion: @escaping GetUsersCompletion) {
        let users = [
            UserModel(name: "Felipe", description: "felipe@gmail.com", isActivated: false),
            UserModel(name: "De Luca", description: "deluca@gmail.com", isActivated: false),
            UserModel(name: "William", description: "william@gmail.com", isActivated: false),
            UserModel(name: "Gusta", description: "gusta@gmail.com", isActivated: false)
        ]
        
        completion(.success(users))
    }
}
