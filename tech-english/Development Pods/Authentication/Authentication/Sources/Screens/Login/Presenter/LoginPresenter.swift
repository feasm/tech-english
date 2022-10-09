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
import AuthenticationServices

public protocol LoginPresenterCoordinator {
    func openTestScreen()
    func openRegisterNameScreen()
}

protocol LoginPresenterProtocol {
    func isUserAuthenticated()
    
    func didTapLoginButton()
    func didTapSignUpButton()
    
    func didTapFacebookLoginButton(view: UIViewController)
    func didTapGoogleLoginButton(view: UIViewController)
    func didTapAppleLoginButton(view: UIViewController)
    
    var email: String? {get set}
    var password: String? {get set}
    var rememberMeEnabled: Bool {get set}
}

public class LoginPresenter: LoginPresenterProtocol {
    
    var rememberMeEnabled: Bool = false
    var coordinator: LoginPresenterCoordinator?
    var service: LoginServiceProtocol
    var email: String?
    var password: String?
    
    
    public init(service: LoginServiceProtocol) {
        self.service = service
    }
    
    func isUserAuthenticated() {
        if app.currentUser != nil {
            coordinator?.openTestScreen()
        }
    }
    
    public func isRememberMeEnabled() {
        if rememberMeEnabled == false {
            service.logOut()
        }
    }
    
    func didTapLoginButton () {
        service.loginWith(email: email ?? "", password: password ?? "")
    }
    
    func didTapSignUpButton() {
        coordinator?.openRegisterNameScreen()
    }
    
    func didTapFacebookLoginButton(view: UIViewController) {
        service.loginWithFacebook(view: view)
    }
    
    func didTapGoogleLoginButton(view: UIViewController) {
        service.loginWithGoogle(view: view)
    }
    
    func didTapAppleLoginButton(view: UIViewController) {
        service.loginWithApple(view: view)
    }
}

extension LoginPresenter: LoginServiceDelegate {
    func didLoginSuccessfully() {
        self.coordinator?.openTestScreen()
    }
}
