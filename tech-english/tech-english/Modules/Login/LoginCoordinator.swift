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
//       let loginViewController = LoginViewController()
//
//       navigationViewController?.pushViewController(loginViewController, animated: true)
         showRegisterName()
    }
    func showRegisterName() {
        let registerViewController = RegisterNameViewController()
        
        navigationViewController?.pushViewController(registerViewController, animated: true)
    }
    
}

//extension UserSelectionFeatureCoordinator: SelectUsersCoordinator {
//    func showUserList(userModels: [UserModel]) {
//        let presenter = UserListPresenterImpl(userModels: userModels)
//        let viewController = UserListViewControllerImpl(presenter: presenter)
//
//        navigationViewController?.pushViewController(viewController, animated: true)
//    }
//}
