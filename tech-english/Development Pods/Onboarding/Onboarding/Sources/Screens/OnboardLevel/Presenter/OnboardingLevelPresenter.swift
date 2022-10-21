//
//  OnboardLevelPresenter.swift
//  tech-english
//
//  Created by Gustavo Domingues on 29/09/22.
//

import Foundation

class OnboardingLevelPresenter {
    
    var lvlUser: String?
    var service: OnboardingLevelService
    
    public init(service: OnboardingLevelService) {
        self.service = service
    }
}
