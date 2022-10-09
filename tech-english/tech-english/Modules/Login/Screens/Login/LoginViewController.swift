//
//  LoginViewController.swift
//  tech-english
//
//  Created by William Reinert on 11/09/22.
//

import UIKit
import TNUI

class LoginViewController: UIViewController {

    var coordinator: LoginCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private func setupUI() {
        signInButton.layer.cornerRadius = 6
        contentView.layer.cornerRadius = 15
        
        let emailImage = "mail-icon"
        let passwordImage = "lock-icon"
        let revealPasswordImage = "password-icon"
        emailTextField.setupImage(imageName: emailImage, on: .left, x: 18, y: 10, width: 20, height: 20)
        passwordTextField.setupImage(imageName: passwordImage, on: .left, x: 18, y: 10, width: 20, height: 20)
        passwordTextField.setupImage(imageName: revealPasswordImage, on: .right, x: 0, y: 10, width: 20, height: 20)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTogglePasswordButtonTapped(sender:)))
        passwordTextField.rightView?.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func PressedSignUpButton(_ sender: Any) {
        coordinator?.showRegisterName()
    }
    @objc func handleTogglePasswordButtonTapped(sender: UIGestureRecognizer) {
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
    }

}
