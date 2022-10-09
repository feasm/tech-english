//
//  UserSelectionFeatureCoordinator.swift
//  tech-english
//
//  Created by Felipe Alexander Da Silva Melo on 07/09/22.
//

import Foundation
import UIKit
import TNCore

public final class UserSelectionFeatureCoordinator: Coordinator {
    
    public var currentViewController: UIViewController?
    public var navigationViewController: UINavigationController?
    
    public init(navigationController: UINavigationController?) {
        self.navigationViewController = navigationController
    }
    
    public func start() {
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
