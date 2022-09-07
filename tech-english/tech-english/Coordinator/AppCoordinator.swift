//
//  AppCoordinator.swift
//  tech-english
//
//  Created by Felipe Alexander Da Silva Melo on 07/09/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var currentViewController: UIViewController? { get }
    var navigationViewController: UINavigationController? { get }
    
    func start()
}

final class AppCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationViewController: UINavigationController?
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        navigationViewController = UINavigationController()
        
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        
        let coordinator = UserSelectionFeatureCoordinator(navigationController: navigationViewController)
        coordinator.start()
    }
    
}
