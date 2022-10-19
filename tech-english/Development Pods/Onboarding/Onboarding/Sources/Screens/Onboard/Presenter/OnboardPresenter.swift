//
//  OnboardPresenter.swift
//  tech-english
//
//  Created by Gustavo Domingues on 27/09/22.
//

import Foundation

public protocol OnboardingPresenterCoordinator {
    func openLevelScreen()
}

class OnboardPresenter {
    
    var userName: String?
    var birthData:String?
    var service: OnboardService
    var coordinator: OnboardingPresenterCoordinator?
    
    func didTapNextButton() {
        coordinator?.openLevelScreen()
    }
    public init(service: OnboardService) {
        self.service = service
        self.coordinator?.openLevelScreen()
    }
}

