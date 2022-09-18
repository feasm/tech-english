//
//  LoginCoordinator.swift
//  tech-english
//
//  Created by William Reinert on 11/09/22.
//

import Foundation
import UIKit

final class LoginCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationViewController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationViewController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        
        navigationViewController?.pushViewController(viewController, animated: true)
    }
    
}
