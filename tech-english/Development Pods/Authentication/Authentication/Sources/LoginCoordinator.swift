//
//  LoginCoordinator.swift
//  tech-english
//
//  Created by William Reinert on 11/09/22.
//

import Foundation
import UIKit

import TNCore

public final class LoginCoordinator: Coordinator {
    
    public var currentViewController: UIViewController?
    public var navigationViewController: UINavigationController?
    
    public init(navigationController: UINavigationController?) {
        self.navigationViewController = navigationController
    }
    
    public func start() {
        let service = LoginService()
        let presenter = LoginPresenter(service: service)
        let viewController = LoginViewController(presenter: presenter)
        
        presenter.coordinator = self
        service.delegate = presenter
        presenter.isUserAuthenticated()
        navigationViewController?.pushViewController(viewController, animated: true)
    }
}

extension LoginCoordinator: LoginPresenterCoordinator {
    public func openTestScreen() {
        let viewController = TestViewController()
        
        DispatchQueue.main.async {
            self.navigationViewController?.pushViewController(viewController, animated: true)
        }
    }
    
    public func openRegisterNameScreen() {
        let viewController = RegisterNameViewController()
        
        navigationViewController?.pushViewController(viewController, animated: true)
    }
}
