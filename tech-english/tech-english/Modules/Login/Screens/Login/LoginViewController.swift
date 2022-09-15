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
        contentView.layer.cornerRadius = 15
        
        emailTextField.setupImage(imageName: emailImage, on: .left, x: 18, y: 10, width: 20, height: 20)
        passwordTextField.setupImage(imageName: passwordImage, on: .left, x: 18, y: 10, width: 20, height: 20)
        passwordTextField.setupImage(imageName: revealPasswordImage, on: .right, x: 0, y: 10, width: 20, height: 20)
       
        addTapRecognizer(target: passwordTextField.rightView, handler: #selector(handleTogglePasswordButtonTapped(sender:)))
        
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

    @objc func handleTogglePasswordButtonTapped(sender: UIGestureRecognizer) {
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
            passwordTextField.setupImage(imageName: hidePasswordImage, on: .right, x: 0, y: 10, width: 20, height: 20)
            addTapRecognizer(target: passwordTextField.rightView, handler: #selector(handleTogglePasswordButtonTapped(sender:)))
        } else {
            passwordTextField.isSecureTextEntry = true
            passwordTextField.setupImage(imageName: revealPasswordImage, on: .right, x: 0, y: 10, width: 20, height: 20)
            addTapRecognizer(target: passwordTextField.rightView, handler: #selector(handleTogglePasswordButtonTapped(sender:)))
        }
    }
}

//quando eu tiro a classe daqui e coloca no arquivo do TNUI nao funciona, o texto placeholder dos textfields fica fora de alinhamento de novo
protocol LoginTextFieldDelegate: AnyObject {
    
}

public class LoginTextField: UITextField {
    var textPadding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    var textField: UITextField?
    let revealPasswordImage = "password-icon"
    let hidePasswordImage = "passwordoff-icon"
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}





