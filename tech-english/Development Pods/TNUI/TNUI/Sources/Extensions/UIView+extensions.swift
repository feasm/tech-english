//
//  File.swift
//  
//
//  Created by Felipe Alexander Da Silva Melo on 07/09/22.
//

import UIKit

public extension UIView {
    func loadViewFromNib<T>(_ classType: T.Type) -> T? {
        let nibName = String(describing: classType)
        let nib = UINib(nibName: nibName, bundle: Bundle(identifier: "TNUI"))
        
        return nib.instantiate(withOwner: self).first as? T
    }
}
