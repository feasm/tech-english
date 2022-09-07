//
//  TNSwitch.swift
//  
//
//  Created by Felipe Alexander Da Silva Melo on 06/09/22.
//

import UIKit

public class TNSwitch: UISwitch {

    public init() {
        super.init(frame: .zero)
        onTintColor = .lightBlue
        thumbTintColor = .primaryBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
