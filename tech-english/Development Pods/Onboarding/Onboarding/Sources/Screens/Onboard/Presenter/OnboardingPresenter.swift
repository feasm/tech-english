//
//  OnboardPresenter.swift
//  tech-english
//
//  Created by Gustavo Domingues on 27/09/22.
//

import Foundation

public protocol OnboardingCoordinatorProtocol {
    func openLevelScreen()
}

class OnboardingPresenter {
    
    var userName: String?
    var birthData: String?
    var service: OnboardingService?
    var coordinator: OnboardingCoordinator?
    
    func didTapNextButton() {
        coordinator?.openLevelScreen()
    }
    
    public init(service: OnboardingService) {
        self.service = service
    }
}

