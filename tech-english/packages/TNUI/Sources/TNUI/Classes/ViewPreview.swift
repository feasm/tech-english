//
//  File.swift
//  
//
//  Created by Felipe Alexander Da Silva Melo on 04/09/22.
//

import UIKit
import SwiftUI

public struct ViewPreview: UIViewRepresentable {
    let viewBuilder: () -> UIView
    
    public init(_ viewBuilder: @escaping () -> UIView) {
        self.viewBuilder = viewBuilder
    }
    
    public func makeUIView(context: Context) -> some UIView {
        return viewBuilder()
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
