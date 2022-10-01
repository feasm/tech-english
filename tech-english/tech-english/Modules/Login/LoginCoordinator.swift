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
        let service = LoginService()
        let presenter = LoginPresenter(service: service)
        let viewController = LoginViewController(presenter: presenter)
        
        presenter.coordinator = self
        presenter.isUserAuthenticated()
        navigationViewController?.pushViewController(viewController, animated: true)
    }
}

extension LoginCoordinator: LoginPresenterCoordinator {
    func openTestScreen() {
        let viewController = TestViewController()
        
        DispatchQueue.main.async {
            self.navigationViewController?.pushViewController(viewController, animated: true)
        }
    }
}
