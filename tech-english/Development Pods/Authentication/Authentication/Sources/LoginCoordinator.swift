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
        let presenter = RegisterNamePresenter()
        let viewController = RegisterNameViewController(presenter: presenter)
        
        presenter.coordinator = self
        navigationViewController?.pushViewController(viewController, animated: true)
    }
}

extension LoginCoordinator: RegisterNameCoordinator {
    public func openRegisterNumberScreen() {
        let presenter = RegisterNumberPresenter()
        let viewController = RegisterNumberViewController(presenter: presenter)
        
        presenter.coordinator = self
        navigationViewController?.pushViewController(viewController, animated: true)
    }
}

extension LoginCoordinator: RegisterNumberCoordinator {
    public func openRegisterEmailScreen() {
        let presenter = RegisterEmailPresenter()
        let viewController = RegisterEmailViewController(presenter: presenter)
        
        presenter.coordinator = self
        navigationViewController?.pushViewController(viewController, animated: true)
    }
}
extension LoginCoordinator: RegisterEmailCoordinator {
    public func openRegisterPasswordScreen() {
        let viewController = RegisterPasswordViewController()
        
        navigationViewController?.pushViewController(viewController, animated: true)
    }
}
