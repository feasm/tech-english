//
//  LoginViewController.swift
//  tech-english
//
//  Created by William Reinert on 11/09/22.
//

import UIKit
import TNCore
import TNUI

class LoginViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var emailTextField: LoginTextField!
    @IBOutlet weak var passwordTextField: LoginTextField!
    @IBOutlet weak var signUpLabel: UILabel!
    
    let loginTextField = LoginTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginTextField.loginTextFieldDelegate = self
        setupUI()
        loginTextField.setupTextField(view: [emailTextField, passwordTextField])
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
        // criar a transicao para tela de registro aqui
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





