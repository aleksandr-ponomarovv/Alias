//
//  AppCoordinator.swift
//  Alias
//
//  Created by Aleksandr on 31.03.2022.
//

import UIKit

protocol BaseCoordinator {
    func start()
}

class AppCoordinator: BaseCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = startController()
        window.makeKeyAndVisible()
    }
}

// MARK: - Private methods
private extension AppCoordinator {
    func startController() -> UIViewController {
        let mainViewController = MainViewController()
        let configurator: MainConfiguratorType = MainConfigurator()
        configurator.configure(viewController: mainViewController)
        return mainViewController
    }
}
