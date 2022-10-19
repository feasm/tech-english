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
    func setUserDefaults(value: Bool)
    
    func didTapLoginButton()
    func didTapSignUpButton()
    
    func didTapFacebookLoginButton(view: UIViewController)
    func didTapGoogleLoginButton(view: UIViewController)
    func didTapAppleLoginButton(view: UIViewController)
    
    var email: String? {get set}
    var password: String? {get set}
    var rememberMeEnabled: Bool {get set}
}

protocol LoginPresenterDelegate: AnyObject {
    func didProvideIncorrectCredentials()
}

public class LoginPresenter: LoginPresenterProtocol {
    
    weak var delegate: LoginPresenterDelegate?
    var rememberMeEnabled: Bool = false
    var coordinator: LoginPresenterCoordinator?
    var service: LoginServiceProtocol
    var email: String?
    var password: String?
    let userDefaults = UserDefaults.standard
    
    public init(service: LoginServiceProtocol) {
        self.service = service
    }
    
    func isUserAuthenticated() {
        if app.currentUser != nil {
            coordinator?.openTestScreen()
        }
    }
    
    func setUserDefaults(value: Bool) {
        userDefaults.set(value, forKey: "rememberMeEnabled")
    }
    
    func isRememberMeEnabled() {
        if userDefaults.bool(forKey: "rememberMeEnabled") {
            isUserAuthenticated()
        } else {
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
        if rememberMeEnabled == false {
            userDefaults.set(false, forKey: "rememberMeEnabled")
        }
        self.coordinator?.openTestScreen()
    }
    
    func didFailToLogin() {
        self.delegate?.didProvideIncorrectCredentials()
    }
}
