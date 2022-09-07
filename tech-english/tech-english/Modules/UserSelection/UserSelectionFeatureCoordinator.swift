//
//  UserSelectionFeatureCoordinator.swift
//  tech-english
//
//  Created by Felipe Alexander Da Silva Melo on 07/09/22.
//

import Foundation
import UIKit

final class UserSelectionFeatureCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationViewController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationViewController = navigationController
    }
    
    func start() {
        let service = SelectUsersServiceMock()
        let presenter = SelectUsersPresenterImpl(coordinator: self, service: service)
        let viewController = SelectUsersViewControllerImpl(presenter: presenter)
        presenter.viewController = viewController
        
        navigationViewController?.pushViewController(viewController, animated: true)
    }
    
}

extension UserSelectionFeatureCoordinator: SelectUsersCoordinator {
    func showUserList(userModels: [UserModel]) {
        let presenter = UserListPresenterImpl(userModels: userModels)
        let viewController = UserListViewControllerImpl(presenter: presenter)
        
        navigationViewController?.pushViewController(viewController, animated: true)
    }
}
