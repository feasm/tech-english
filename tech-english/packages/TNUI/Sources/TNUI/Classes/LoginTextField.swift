//
//  LoginTextField.swift
//  
//
//  Created by William Reinert on 14/09/22.
//

import Foundation
import UIKit
import TNCore

public protocol LoginTextFieldDelegate: AnyObject {
    func didTapTogglePasswordButton()
}

public class LoginTextField: UITextField {
    
    weak public var loginTextFieldDelegate: LoginTextFieldDelegate?
    var textField: UITextField?
    var targetView: UIView?
    public var passwordImage = Constants.hidePasswordImage
    var textPadding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    public func setupTextField(view: [LoginTextField]) {
        for view in view {
            view.layer.cornerRadius = 6
            view.borderStyle = .none
            self.textField = view
            if view.rightView != nil {
                addTapRecognizer(target: view.rightView, handler: #selector(handleTogglePasswordButtonTapped(sender:)))
            }
        }
    }
    
    public func togglePasswordButtonTapped() {
        loginTextFieldDelegate?.didTapTogglePasswordButton()
    }
    
    func addTapRecognizer (target: UIView?, handler: Selector) {
        guard let target = target else {return}
        let tapGesture = UITapGestureRecognizer(target: self, action: handler)
        target.addGestureRecognizer(tapGesture)
        togglePasswordButtonTapped()
    }
    
    @objc func handleTogglePasswordButtonTapped(sender: UIGestureRecognizer) {
        guard let textField = textField else {return}
        textField.setupImage(imageName: self.passwordImage, on: .right, x: 0, y: 10, width: 20, height: 20)
            addTapRecognizer(target: textField.rightView, handler: #selector(handleTogglePasswordButtonTapped(sender:)))
    }
    
}
