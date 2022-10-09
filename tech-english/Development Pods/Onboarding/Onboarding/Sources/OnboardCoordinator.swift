//
//  OnboardCoordinator.swift
//  tech-english
//
//  Created by Gustavo Domingues on 26/09/22.
//

import Foundation
import UIKit

import TNCore

public final class OnboardCoordinator: Coordinator {
    
    public var currentViewController: UIViewController?
    public var navigationViewController: UINavigationController?
    
    public init(navigationController: UINavigationController?) {
        self.navigationViewController = navigationController
    }
    
    public func start() {
//      let viewController = OnboardViewController()
        let viewController = OnboardLevel()

       navigationViewController?.pushViewController(viewController, animated: true)
         //showRegisterName()
    }
//    func showRegisterName() {
//        let viewController = RegisterNameViewController()
//
//        navigationViewController?.pushViewController(viewController, animated: true)
//    }
}

//extension UserSelectionFeatureCoordinator: SelectUsersCoordinator {
//    func showUserList(userModels: [UserModel]) {
//        let presenter = UserListPresenterImpl(userModels: userModels)
//        let viewController = UserListViewControllerImpl(presenter: presenter)
//
//        navigationViewController?.pushViewController(viewController, animated: true)
//    }
//}
