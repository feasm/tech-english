//
//  LoginService.swift
//  tech-english
//
//  Created by William Reinert on 18/09/22.
//

import Foundation
import TNCore
import RealmSwift
import FacebookLogin


let app = App(id: Constants.appID)

typealias LoginCompletion = (Result<User, Error>) -> Void

protocol LoginServiceProtocol {
    func loginWith(email:String, password: String, _ completion: @escaping LoginCompletion)
    func loginWithFacebook(_ completion: @escaping LoginCompletion)
    func logOut()
}

class LoginService: LoginServiceProtocol {
    
    var email: String = ""
    var password: String = ""
    
    func loginWith(email: String, password: String, _ completion: @escaping LoginCompletion) {
        
        let credentials = Credentials.emailPassword(email: email, password: password)
        
        app.login(credentials: credentials) { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let user):
                    completion(.success(user))
                }
            }
        }
    }
    
    func loginWithFacebook(_ completion: @escaping LoginCompletion) {
        let token = AccessToken.current
        let credentials = Credentials.facebook(accessToken: token!.tokenString)
        app.login(credentials: credentials) { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let user):
                    completion(.success(user))
                }
            }
        }
    }

    func logOut() {
        app.currentUser?.logOut(completion: { error in
            if let error = error {
                print(error)
            }
        })
    }
}
