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
    @IBOutlet weak var rememberMeButton: UIButton!
    
    var presenter: LoginPresenterProtocol?
    //posso instanciar o logintextfield desta maneira ou precisa ser feito dependency injection
    let loginTextField = LoginTextField()
    
    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
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





