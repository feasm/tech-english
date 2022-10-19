//
//  LoginService.swift
//  tech-english
//
//  Created by William Reinert on 18/09/22.
//

import Foundation
import TNCore
import RealmSwift
import FBSDKCoreKit
import FacebookCore
import FacebookLogin
import GoogleSignIn
import AuthenticationServices

let app = App(id: Constants.appID)

typealias LoginCompletion = (Result<User, Error>) -> Void

public protocol LoginServiceProtocol {
    func loginWith(email:String, password: String)
    func loginWithFacebook(view: UIViewController)
    func loginWithGoogle(view: UIViewController)
    func loginWithApple(view: UIViewController)
    func logOut()
}

protocol LoginServiceDelegate: AnyObject {
    func didLoginSuccessfully()
    func didFailToLogin()
}

public class LoginService: NSObject, LoginServiceProtocol {
    
    let loginManager = LoginManager()
    let googleClientID = GIDConfiguration(clientID: Constants.googleClientID)
    weak var delegate: LoginServiceDelegate?
    
    public override init() {}
    
    private func login(with credentials: Credentials, _ completion: @escaping LoginCompletion) {
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
    
    public func loginWith(email: String, password: String) {
        
        let credentials = Credentials.emailPassword(email: email, password: password)
        
        login(with: credentials) { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("Login failed: \(error.localizedDescription)")
                    self.delegate?.didFailToLogin()
                case .success(let user):
                    print("Login successful with email as user \(user)")
                    self.delegate?.didLoginSuccessfully()
                }
            }
        }
    }
    
    public func loginWithFacebook(view: UIViewController) {
    
        if let _ = AccessToken.current {
            loginManager.logOut()
        } else {
            loginManager.logIn(permissions: [], from: view) { [weak self] (result, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                guard let result = result, !result.isCancelled else {
                    print("User cancelled login")
                    return
                }
                
                let token = AccessToken.current
                let credentials = Credentials.facebook(accessToken: token!.tokenString)
                self?.login(with: credentials) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .failure(let error):
                            print("Login failed: \(error.localizedDescription)")
                        case .success(let user):
                            print("Login successful with Facebook as user \(user)")
                            self?.delegate?.didLoginSuccessfully()
                        }
                    }
                }
            }
        }
    }
    
    public func loginWithGoogle(view: UIViewController) {
        
        GIDSignIn.sharedInstance.signIn(with: googleClientID, presenting: view) { user, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            let idToken = user?.authentication.idToken!
            let credentials = Credentials.googleId(token: idToken!)
            self.login(with: credentials) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let error):
                        print("Login failed: \(error.localizedDescription)")
                    case .success(let user):
                        print("Login successful with Google as user \(user)")
                        self.delegate?.didLoginSuccessfully()
                    }
                }
            }
        }
    }
    
    public func loginWithApple(view: UIViewController) {
        
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = view as? ASAuthorizationControllerDelegate
        controller.presentationContextProvider = view as? ASAuthorizationControllerPresentationContextProviding
        controller.performRequests()
        
        let credentials = Credentials.apple(idToken: "com.age.tech-english")
        self.login(with: credentials) { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("Login failed: \(error.localizedDescription)")
                case .success(let user):
                    print("Login successful with Apple as user \(user)")
                    self.delegate?.didLoginSuccessfully()
                }
            }
        }
    }
    
    public func logOut() {
        app.currentUser?.logOut(completion: { error in
            if let error = error {
                print(error)
            }
        })
    }
}

extension LoginService: ASAuthorizationControllerDelegate {
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("failed")
    }
    
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            let firstName = credentials.fullName?.givenName
            let lastName = credentials.fullName?.familyName
            let email = credentials.email
            print(firstName, lastName, email)
            break
        default:
            break
        }
    }
}






