//
//  OnboardViewController.swift
//  tech-english
//
//  Created by Gustavo Domingues on 26/09/22.
//

import UIKit
import TLCustomMask

import TNCore

class OnboardViewController: TEBaseViewController {
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var dataText: UITextField!
    @IBOutlet weak var principalLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    var buttonConstraint: CGFloat = 0
    var dataMask = TLCustomMask(formattingPattern: "$$/$$/$$$$")
    var nickMask = TLCustomMask(formattingPattern: "*************************")
    var presenter: OnboardPresenter?
    
    init(presenter: OnboardPresenter) {
        self.presenter = presenter
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
                presenter?.birthData = data
                print(presenter?.birthData ?? "Teste Falho")
            }
        }
        if nameText.text == "" {
            nameText.placeholder = "Campo Obrigatorio"
        }
        if nameText.text != ""{
            if let name = nameText.text {
                presenter?.userName = name
                print(presenter?.userName ?? "Teste Falho")
            }
        }
//        && Function
            nextOnboardScreen()
    }
    
    func nextOnboardScreen() {
        presenter?.didTapNextButton()
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
                nextButton.frame.origin.y -= nextButton.frame.origin.y + 125
                view.frame.origin.y = buttonConstraint
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if nextButton.frame.origin.y != buttonConstraint {
                nextButton.frame.origin.y = buttonConstraint
                view.frame.origin.y = 0
                
            }
        }
    }
}
extension OnboardViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

            dataText.text = dataMask.formatStringWithRange(range: range, string: string)
        nameText.text = nickMask.formatStringWithRange(range: range, string: string)
            return false
        }
}

    



