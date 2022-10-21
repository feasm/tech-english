//
//  OnboardCoordinator.swift
//  tech-english
//
//  Created by Gustavo Domingues on 26/09/22.
//

import Foundation
import UIKit
import TNCore

public final class OnboardingCoordinator: Coordinator {
    
    public var currentViewController: UIViewController?
    public var navigationViewController: UINavigationController?
    
    public init(navigationController: UINavigationController?) {
        self.navigationViewController = navigationController
    }
    
    public func start() {
        let service = OnboardingService()
        let presenter = OnboardingPresenter(service: service)
        let viewController = OnboardingViewController(presenter: presenter)
        
        presenter.coordinator = self
        navigationViewController?.pushViewController(viewController, animated: true)
    }
}

extension OnboardingCoordinator: OnboardingCoordinatorProtocol {
    public func openLevelScreen() {
        let service = OnboardingLevelService()
        let presenter = OnboardingLevelPresenter(service: service)
        let viewController = OnboardingLevelViewController(presenter: presenter)
        
        DispatchQueue.main.async { [weak self] in
        self?.navigationViewController?.pushViewController(viewController, animated: true)
        }
    }
}
