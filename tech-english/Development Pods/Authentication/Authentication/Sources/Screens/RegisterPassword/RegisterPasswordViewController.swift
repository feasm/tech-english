//
//  RegisterPasswordViewController.swift
//  Authentication
//
//  Created by Vinicius de Luca on 25/10/22.
//

import UIKit
import TNCore

class RegisterPasswordViewController: TEBaseViewController {

    
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var divider: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorText: UILabel!
    @IBOutlet weak var errorText2: UILabel!
    
    var originalYButton:CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    private func updateUI(){
        
        errorText.text = ""
        errorText2.text = ""
        
        returnButton.setTitle("", for: .normal)
        
        let arrowImage = UIImage(named: "Arrowleft2.png")
        returnButton.setImage(arrowImage?.withRenderingMode(.alwaysOriginal), for: .normal)

        originalYButton = signUpButton.frame.origin.y
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        signUpLabel.numberOfLines = 3
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pressedNextButton(_ sender: UIButton) {
        
        if passwordTextField.text == "" {
            errorText.text = "Este campo não pode estar vazio"
        }
        else {
            errorText.text = ""
        }
        if confirmPasswordTextField.text == "" {
            errorText2.text = "Este campo não pode estar vazio"
        }
        else {
            errorText2.text = ""
        }
        if confirmPasswordTextField.text != passwordTextField.text {
            errorText2.text = "As senhas não correspondem"
        }
        else {
//            nextButtonTapped()
        }
        
    }
//    func nextButtonTapped() {
//        presenter?.didTapNextButton()
//    }


    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                let height = keyboardSize.height
                self.signUpButton.frame.origin.y -= height

        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if signUpButton.frame.origin.y != originalYButton {
            self.signUpButton.frame.origin.y = originalYButton
            }
        }
}

