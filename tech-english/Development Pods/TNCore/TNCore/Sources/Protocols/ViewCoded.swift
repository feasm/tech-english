//
//  File.swift
//  
//
//  Created by Felipe Alexander Da Silva Melo on 04/09/22.
//

import Foundation

public protocol ViewCoded {
    func buildViewHierarchy()
    func setupConstraints()
    func addAdditionalConfiguration()
}

public extension ViewCoded {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        addAdditionalConfiguration()
    }
}
