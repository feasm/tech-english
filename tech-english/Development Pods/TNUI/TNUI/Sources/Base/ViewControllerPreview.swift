//
//  File.swift
//  
//
//  Created by Felipe Alexander Da Silva Melo on 04/09/22.
//

import Foundation
import SwiftUI

public struct ViewControllerPreview: UIViewControllerRepresentable {
    let viewControllerBuilder: () -> UIViewController
    
    public init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }
    
    public func makeUIViewController(context: Context) -> some UIViewController {
        return viewControllerBuilder()
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
