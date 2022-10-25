//
//  RegisterEmailPresenter.swift
//  Authentication
//
//  Created by Vinicius de Luca on 25/10/22.
//

import Foundation
import UIKit
import TNCore

public protocol RegisterEmailCoordinator {
    func openRegisterPasswordScreen()
}

protocol RegisterEmailPresenterProtocol {
    func didTapNextButton()
    func isValidEmail(_ emailID: String) -> Bool
}

public class RegisterEmailPresenter: RegisterEmailPresenterProtocol {
    var coordinator: RegisterEmailCoordinator?
    
    func didTapNextButton() {
        coordinator?.openRegisterPasswordScreen()
    }
    
    func isValidEmail(_ emailID: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailID)
    }
}
