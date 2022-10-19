//
//  RegisterPresenter.swift
//  Authentication
//
//  Created by Vinicius de Luca on 18/10/22.
//

import Foundation
import UIKit
import TNCore

public protocol RegisterNameCoordinator {
    func openRegisterNumberScreen()
}

protocol RegisterNamePresenterProtocol {
    func didTapNextButton()
}

public class RegisterNamePresenter: RegisterNamePresenterProtocol {
    var coordinator: RegisterNameCoordinator?
    
    func didTapNextButton() {
        coordinator?.openRegisterNumberScreen()
    }
}
