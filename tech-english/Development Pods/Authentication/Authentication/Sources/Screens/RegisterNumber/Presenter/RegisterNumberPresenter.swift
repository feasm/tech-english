//
//  RegisterPresenter.swift
//  Authentication
//
//  Created by Vinicius de Luca on 18/10/22.
//

import Foundation
import UIKit
import TNCore

public protocol RegisterNumberCoordinator {
    func openRegisterEmailScreen()
}

protocol RegisterNumberPresenterProtocol {
    func didTapNextButton()
}

public class RegisterNumberPresenter: RegisterNumberPresenterProtocol {
    var coordinator: RegisterNumberCoordinator?
    
    func didTapNextButton() {
        coordinator?.openRegisterEmailScreen()
    }
}
