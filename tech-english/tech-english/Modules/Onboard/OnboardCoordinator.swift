//
//  OnboardCoordinator.swift
//  tech-english
//
//  Created by Gustavo Domingues on 26/09/22.
//

import Foundation
import UIKit

final class OnboardCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationViewController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationViewController = navigationController
    }
    
    func start() {
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
