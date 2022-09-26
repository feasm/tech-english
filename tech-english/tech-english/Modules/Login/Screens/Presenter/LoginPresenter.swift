//
//  LoginPresenter.swift
//  tech-english
//
//  Created by William Reinert on 18/09/22.
//

import Foundation

protocol LoginPresenterCoordinator {
    func openTestScreen()
}

protocol LoginPresenterProtocol {
    func isUserAuthenticated()
    func didTapLoginButton()
    var email: String? {get set}
    var password: String? {get set}
    var rememberMeEnabled: Bool {get set}
}

class LoginPresenter: LoginPresenterProtocol {
    
    var rememberMeEnabled: Bool = false
    var coordinator: LoginPresenterCoordinator?
    var service: LoginServiceProtocol
    var email: String?
    var password: String?
    
    init(service: LoginServiceProtocol) {
        self.service = service
    }
    
    func isUserAuthenticated() {
        if app.currentUser != nil {
            coordinator?.openTestScreen()
        }
    }
    
    func isRememberMeEnabled() {
        if rememberMeEnabled == false {
            service.logOut()
        }
    }
    
    func didTapLoginButton () {
        service.loginWith(email: email ?? "", password: password ?? "") { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                print("Successfully logged in as user \(user)")
                self.coordinator?.openTestScreen()
            case .failure(let error):
                print("Login failed: \(error.localizedDescription)")
            }

        }
    }
}

