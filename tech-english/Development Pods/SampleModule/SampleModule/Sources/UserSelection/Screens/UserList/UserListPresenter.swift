//
//  UserListPresenter.swift
//  tech-english
//
//  Created by Felipe Alexander Da Silva Melo on 07/09/22.
//

import Foundation

protocol UserListPresenter {
    var usersViewData: [UserViewData] { get }
}

final class UserListPresenterImpl: UserListPresenter {
    
    let userModels: [UserModel]
    var viewController: UserListViewController?
    
    var usersViewData: [UserViewData]
    
    init(userModels: [UserModel]) {
        self.userModels = userModels
        self.usersViewData = userModels
                                .enumerated()
                                .map({ UserViewData(index: $0,
                                                    title: $1.name,
                                                    description: $1.description,
                                                    isActive: $1.isActivated,
                                                    shouldShowActivation: false) })
    }
    
}
