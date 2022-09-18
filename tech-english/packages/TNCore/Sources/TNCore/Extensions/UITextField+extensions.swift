//
//   UITextField + extensions.swift
//  tech-english
//
//  Created by William Reinert on 12/09/22.
//

import Foundation
import UIKit

public extension UITextField {
    enum TextFieldImageSide {
        case left
        case right
    }

    func setupImage(imageName: String, on side: TextFieldImageSide, x: Int = 0, y: Int = 0, width: Int = 0, height: Int = 0) {
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        if let imageWithSystemName = UIImage(systemName: imageName) {
            imageView.image = imageWithSystemName
        } else {
            imageView.image = UIImage(named: imageName)
        }
        
        let imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: width * 2, height: height * 2))
        imageContainerView.addSubview(imageView)
        
        switch side {
        case .left:
            leftView = imageContainerView
            leftViewMode = .always
        case .right:
            rightView = imageContainerView
            rightViewMode = .always
        }
    }
}
