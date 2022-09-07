//
//  PrimaryButton.swift
//  
//
//  Created by Felipe Alexander Da Silva Melo on 04/09/22.
//

import UIKit

//import TNCore

public class TNPrimaryButton: UIButton {

    public init() {
        super.init(frame: .zero)
//        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//extension TNPrimaryButton: ViewCoded {
//    public func buildViewHierarchy() {
//
//    }
//
//    public func setupConstraints() {
//        snp.makeConstraints { make in
//            make.height.equalTo(44)
//        }
//    }
//
//    public func addAdditionalConfiguration() {
//        backgroundColor = .primaryBlue
//    }
//}
