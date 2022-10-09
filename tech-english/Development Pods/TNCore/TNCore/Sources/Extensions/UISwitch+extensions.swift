//
//  File.swift
//  
//
//  Created by Felipe Alexander Da Silva Melo on 06/09/22.
//

import UIKit

public extension UISwitch {
    func setThumb(scale: CGFloat) {
        if let thumb = self.subviews[0].subviews[1].subviews[2] as? UIImageView {
            thumb.transform = CGAffineTransform(scaleX: scale, y: scale)
            transform = CGAffineTransform(scaleX: scale / 2, y: scale / 2)
        }
    }
}
