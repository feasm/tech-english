//
//  AppCoordinator.swift
//  tech-english
//
//  Created by Felipe Alexander Da Silva Melo on 07/09/22.
//

import Foundation
import UIKit

import TNCore

import Authentication
import SampleModule
import Onboarding

final class AppCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationViewController: UINavigationController?
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        navigationViewController = UINavigationController()
        navigationViewController?.setNavigationBarHidden(true, animated: false)
        
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        
//        let coordinator = UserSelectionFeatureCoordinator(navigationController: navigationViewController)
//        let coordinator = LoginCoordinator(navigationController: navigationViewController)
        let coordinator = OnboardCoordinator(navigationController: navigationViewController)
        coordinator.start()
    }
    
}
