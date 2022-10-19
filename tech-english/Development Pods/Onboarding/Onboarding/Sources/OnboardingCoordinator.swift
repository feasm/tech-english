//
//  OnboardCoordinator.swift
//  tech-english
//
//  Created by Gustavo Domingues on 26/09/22.
//

import Foundation
import UIKit

import TNCore
import Onboarding

public final class OnboardingCoordinator: Coordinator {
    
    public var currentViewController: UIViewController?
    public var navigationViewController: UINavigationController?
    
    public init(navigationController: UINavigationController?) {
        self.navigationViewController = navigationController
    }
    
    public func start() {
        let service = OnboardService()
        let presenter = OnboardPresenter(service: service)
        let viewController = OnboardViewController( presenter: presenter)
        
        presenter.coordinator = self
        navigationViewController?.pushViewController(viewController, animated: true)

    }
}
extension OnboardingCoordinator: OnboardingPresenterCoordinator {
    public func openLevelScreen() {
        let viewController = OnboardLevel()
        
        DispatchQueue.main.async {
            self.navigationViewController?.pushViewController(viewController, animated: true)
        }
    }

}
