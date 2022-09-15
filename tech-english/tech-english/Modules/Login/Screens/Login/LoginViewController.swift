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

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var emailTextField: LoginTextField!
    @IBOutlet weak var passwordTextField: LoginTextField!
    @IBOutlet weak var signUpLabel: UILabel!
    
    let emailImage = "mail-icon"
    let passwordImage = "lock-icon"
    let revealPasswordImage = "password-icon"
    let hidePasswordImage = "passwordoff-icon"
    
    private func setupUI() {
        signInButton.layer.cornerRadius = 6
        emailTextField.layer.cornerRadius = 6
        passwordTextField.layer.cornerRadius = 6
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        emailTextField.layer.masksToBounds = true
        emailTextField.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.cornerRadius = 15
        
        emailTextField.setupImage(imageName: emailImage, on: .left, x: 18, y: 10, width: 20, height: 20)
        passwordTextField.setupImage(imageName: passwordImage, on: .left, x: 18, y: 10, width: 20, height: 20)
        passwordTextField.setupImage(imageName: revealPasswordImage, on: .right, x: 0, y: 10, width: 20, height: 20)
       
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTogglePasswordButtonTapped(sender:)))
        passwordTextField.rightView?.addGestureRecognizer(tapGesture)
        
        let signUpTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSignUpButtonTapped(sender:)))
        signUpLabel.addGestureRecognizer(signUpTapGesture)
    }
    
    func signUpButtonTapped () {
        // criar a transicao para tela de registro aqui
    }
    
    @objc func handleSignUpButtonTapped(sender: UITapGestureRecognizer) {
        signUpButtonTapped()
    }

    @objc func handleTogglePasswordButtonTapped(sender: UIGestureRecognizer) {
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
            passwordTextField.setupImage(imageName: hidePasswordImage, on: .right, x: 0, y: 10, width: 20, height: 20)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTogglePasswordButtonTapped(sender:)))
            passwordTextField.rightView?.addGestureRecognizer(tapGesture)
        } else {
            passwordTextField.isSecureTextEntry = true
            passwordTextField.setupImage(imageName: revealPasswordImage, on: .right, x: 0, y: 10, width: 20, height: 20)
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTogglePasswordButtonTapped(sender:)))
            passwordTextField.rightView?.addGestureRecognizer(tapGesture)
        }
    }
}

//criar class no TNUI
protocol LoginViewControllerDelegate: AnyObject {
    
}

class LoginTextField: UITextField {
    var textPadding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    var textField: UITextField?
    let revealPasswordImage = "password-icon"
    let hidePasswordImage = "passwordoff-icon"
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
//    func addTapRecognizer (textField: UITextField) {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTogglePasswordButtonTapped(sender:)))
//        textField.rightView?.addGestureRecognizer(tapGesture)
//    }
//
//    @objc func handleTogglePasswordButtonTapped(sender: UIGestureRecognizer) {
//        if textField?.isSecureTextEntry == true {
//            textField?.isSecureTextEntry = false
//            textField?.setupImage(imageName: hidePasswordImage, on: .right, x: 0, y: 10, width: 20, height: 20)
//            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTogglePasswordButtonTapped(sender:)))
//            textField?.rightView?.addGestureRecognizer(tapGesture)
//        } else {
//            textField?.isSecureTextEntry = true
//            textField?.setupImage(imageName: revealPasswordImage, on: .right, x: 0, y: 10, width: 20, height: 20)
//            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTogglePasswordButtonTapped(sender:)))
//            textField?.rightView?.addGestureRecognizer(tapGesture)
//        }
//    }
}





