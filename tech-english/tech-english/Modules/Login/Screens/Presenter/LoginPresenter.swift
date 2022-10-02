//
//  LoginPresenter.swift
//  tech-english
//
//  Created by William Reinert on 18/09/22.
//

import Foundation
import FBSDKLoginKit
import GoogleSignIn
import TNCore

protocol LoginPresenterCoordinator {
    func openTestScreen()
}

protocol LoginPresenterProtocol {
    func isUserAuthenticated()
    func didTapLoginButton()
    func didTapFacebookLoginButton(view: UIViewController)
    func didTapGoogleLoginButton(view: UIViewController)
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
        service.loginWith(email: email ?? "", password: password ?? "")
    }
    
    func didTapFacebookLoginButton(view: UIViewController) {
        service.loginWithFacebook(view: view)
    }
    
    func didTapGoogleLoginButton(view: UIViewController) {
        service.loginWithGoogle(view: view)
    }
}

extension LoginPresenter: LoginServiceDelegate {
    func didLoginSuccessfully() {
        self.coordinator?.openTestScreen()
    }
}

