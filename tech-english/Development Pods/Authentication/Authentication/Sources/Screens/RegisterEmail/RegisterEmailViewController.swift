//
//  RegisterEmailViewController.swift
//  Authentication
//
//  Created by Vinicius de Luca on 19/10/22.
//

import UIKit
import Foundation

import TNCore

class RegisterEmailViewController: TEBaseViewController {

    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var divider: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var errorText: UILabel!
    var originalYButton:CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    private func updateUI(){
        
        
        returnButton.setTitle("", for: .normal)
        
        let arrowImage = UIImage(named: "Arrowleft2.png")
        returnButton.setImage(arrowImage?.withRenderingMode(.alwaysOriginal), for: .normal)

        originalYButton = nextButton.frame.origin.y
        
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
        
        if nameTextField.text == "" {
            errorText.text = "Este campo não pode estar vazio"
        }
        else {
            errorText.text = ""
        }
    }



    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                let height = keyboardSize.height
                self.nextButton.frame.origin.y -= height

        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if nextButton.frame.origin.y != originalYButton {
            self.nextButton.frame.origin.y = originalYButton
            }
        }
}
