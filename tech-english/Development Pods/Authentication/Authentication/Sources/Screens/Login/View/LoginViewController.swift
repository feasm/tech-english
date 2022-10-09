//
//  LoginViewController.swift
//  tech-english
//
//  Created by William Reinert on 11/09/22.
//

import UIKit
import TNCore
import TNUI
import FBSDKLoginKit
import AuthenticationServices

class LoginViewController: TEBaseViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var emailTextField: LoginTextField!
    @IBOutlet weak var passwordTextField: LoginTextField!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var rememberMeButton: UIButton!
    
    var presenter: LoginPresenterProtocol?
    let loginTextField = LoginTextField()
    
    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loginTextField.loginTextFieldDelegate = self
        loginTextField.setupTextField(view: [emailTextField, passwordTextField])
    }
    
    @IBAction func rememberMeButtonPressed(_ sender: Any) {
        if rememberMeButton.currentImage == UIImage(systemName: "square") {
            rememberMeButton.setImage(UIImage(systemName: "square.fill"), for: .normal)
            presenter?.rememberMeEnabled = true
        } else {
            rememberMeButton.setImage(UIImage(systemName: "square"), for: .normal)
            presenter?.rememberMeEnabled = false
        }
    }

    @IBAction func singInButtonTapped(_ sender: Any) {
        presenter?.email = emailTextField.text ?? ""
        presenter?.password = passwordTextField.text ?? ""
        presenter?.didTapLoginButton()
    }
    
    @IBAction func facebookSignInButtonTapped(_ sender: Any) {
        presenter?.didTapFacebookLoginButton(view: self)
    }
    
    @IBAction func googleSignInButtonTapped(_ sender: Any) {
        presenter?.didTapGoogleLoginButton(view: self)
    }
    
    @IBAction func appleSignInButtonTapped(_ sender: Any) {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
        
        presenter?.didTapAppleLoginButton(view: self)
    }
    
    private func setupUI() {
        signInButton.layer.cornerRadius = 6
        contentView.layer.cornerRadius = 15
        
        emailTextField.setupImage(imageName: Constants.emailImage, on: .left, x: 18, y: 10, width: 20, height: 20)
        passwordTextField.setupImage(imageName: Constants.passwordImage, on: .left, x: 18, y: 10, width: 20, height: 20)
        passwordTextField.setupImage(imageName: Constants.revealPasswordImage, on: .right, x: 0, y: 10, width: 20, height: 20)
        
        addTapRecognizer(target: signUpLabel, handler: #selector(handleSignUpButtonTapped(sender:)))
    }

    func addTapRecognizer (target: UIView?, handler: Selector) {
        guard let target = target else {return}
        let tapGesture = UITapGestureRecognizer(target: self, action: handler)
        target.addGestureRecognizer(tapGesture)
    }
    
    func signUpButtonTapped () {
        presenter?.didTapSignUpButton()
    }
    
    @objc func handleSignUpButtonTapped(sender: UITapGestureRecognizer) {
        signUpButtonTapped()
    }
}

extension LoginViewController: LoginTextFieldDelegate {
    func didTapTogglePasswordButton() {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            loginTextField.passwordImage = Constants.revealPasswordImage
        } else {
            passwordTextField.isSecureTextEntry = true
            loginTextField.passwordImage = Constants.hidePasswordImage
        }
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("failed")
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
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

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}





