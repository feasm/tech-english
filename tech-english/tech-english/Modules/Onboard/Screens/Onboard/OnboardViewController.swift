//
//  OnboardViewController.swift
//  tech-english
//
//  Created by Gustavo Domingues on 26/09/22.
//

import UIKit
import TLCustomMask

class OnboardViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var dataText: UITextField!
    @IBOutlet weak var principalLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    var buttonConstraint: CGFloat = 0
    var customMask = TLCustomMask(formattingPattern: "$$/$$/$$$$")
    var presenter = OnboardPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataText.delegate = self
        nameText.delegate = self
        buttonConstraint = nextButton.frame.origin.y
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        
    }
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        if dataText.text == "" {
            dataText.placeholder = "Campo Obrigatorio"
        }
        if dataText.text != ""{
            if let data = dataText.text {
                presenter.birthData = data
                print(presenter.birthData ?? "Teste Falho")
            }
        }
        if nameText.text == "" {
            nameText.placeholder = "Campo Obrigatorio"
        }
        if nameText.text != ""{
            if let name = nameText.text {
                presenter.userName = name
                print(presenter.userName ?? "Teste Falho")
            }
        }
    }
    
    private func textFieldDidEndEditing(textField: UITextField) -> Bool {
        
        if textField.text != "" {
            return true
        }else{
            return false
        }
            
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {

        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                let height = keyboardSize.height
                nextButton.frame.origin.y -= height
                view.frame.origin.y -= height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y != 0 {
                let height = keyboardSize.height
                nextButton.frame.origin.y += height
                view.frame.origin.y = 0
                
            }
        }
    }
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        dataText.text = customMask.formatStringWithRange(range: range, string: string)
        return false
    }
}

    



