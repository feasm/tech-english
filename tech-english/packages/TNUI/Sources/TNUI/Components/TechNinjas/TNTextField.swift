//
//  TNTextField.swift
//  
//
//  Created by Felipe Alexander Da Silva Melo on 06/09/22.
//

import UIKit

public struct TNTextFieldParams {
    public let textPadding: UIEdgeInsets
    
    public init(textPadding: UIEdgeInsets = UIEdgeInsets(
        top: 10,
        left: 20,
        bottom: 10,
        right: 20
    )) {
        self.textPadding = textPadding
    }
}

public class TNTextField: UITextField {
    
    let params: TNTextFieldParams
    
    public init(params: TNTextFieldParams = TNTextFieldParams()) {
        self.params = params
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: params.textPadding)
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: params.textPadding)
    }

}
