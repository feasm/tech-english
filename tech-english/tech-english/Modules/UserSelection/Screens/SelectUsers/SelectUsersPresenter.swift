//
//  SelectUsersPresenter.swift
//  tech-english
//
//  Created by Felipe Alexander Da Silva Melo on 07/09/22.
//

import Foundation
import TNUI

typealias UserViewData = TEUserSummaryViewCell.ViewData

protocol SelectUsersCoordinator {
    func showUserList(userModels: [UserModel])
}

protocol SelectUsersPresenter {
    var usersViewData: [UserViewData] { get }
    
    func getUsers()
    func setUserActive(_ index: Int, _ isActive: Bool)
    
    func onSearchTextChanged(text: String)
    func didTapSelectButton()
}

final class SelectUsersPresenterImpl: SelectUsersPresenter {
    
    let coordinator: SelectUsersCoordinator
    let service: SelectUsersService
    var viewController: SelectUsersViewController?
    
    var userModels = [UserModel]()
    var filteredUserModels = [UserModel]()
    var usersViewData = [UserViewData]()
    
    init(coordinator: SelectUsersCoordinator, service: SelectUsersService) {
        self.coordinator = coordinator
        self.service = service
    }
    
    func getUsers() {
        service.getUsers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let userModels):
                self.userModels = userModels
                self.filteredUserModels = userModels
                self.usersViewData = self.mapToViewData(userModels)
                
                self.viewController?.updateUsers()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setUserActive(_ index: Int, _ isActive: Bool) {
        filteredUserModels[index].isActivated = isActive
    }
    
    func onSearchTextChanged(text: String) {
        filteredUserModels = text.isEmpty ? userModels : userModels.filter({ $0.name.contains(text) })
        usersViewData = mapToViewData(text.isEmpty ? userModels : filteredUserModels)
        
        viewController?.updateUsers()
    }
    
    func didTapSelectButton() {
        let activatedModels = userModels.filter({ $0.isActivated })
        coordinator.showUserList(userModels: activatedModels)
    }
    
    private func mapToViewData(_ userModels: [UserModel]) -> [UserViewData] {
        return userModels.enumerated().map({ UserViewData(index: $0,
                                             title: $1.name,
                                             description: $1.description,
                                             isActive: $1.isActivated) })
    }
    
}
