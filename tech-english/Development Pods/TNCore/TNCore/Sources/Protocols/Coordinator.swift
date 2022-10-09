//
//  Coordinator.swift
//  TNCore
//
//  Created by Felipe Alexander Da Silva Melo on 08/10/22.
//

import Foundation

public protocol Coordinator {
    var currentViewController: UIViewController? { get }
    var navigationViewController: UINavigationController? { get }
    
    func start()
}
