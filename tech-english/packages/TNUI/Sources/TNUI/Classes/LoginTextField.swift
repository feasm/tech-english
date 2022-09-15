//
//  LoginTextField.swift
//  
//
//  Created by William Reinert on 14/09/22.
//

import Foundation
import UIKit

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
