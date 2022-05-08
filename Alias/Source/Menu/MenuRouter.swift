//
//  MainRouter.swift
//  Alias
//
//  Created by Aleksandr on 17.04.2022.
//

import Foundation

protocol MenuRouterType {
    func showGameSettingsScreen()
}

class MenuRouter: MenuRouterType {
    
    private weak var viewController: MenuViewController?
    
    init(viewController: MenuViewController) {
        self.viewController = viewController
    }
    
    func showGameSettingsScreen() {
        let gameViewController = GameSettingsViewController()
        let configurator: GameSettingsConfiguratorType = GameSettingsConfigurator()
        configurator.configure(viewController: gameViewController)
        viewController?.navigationController?.pushViewController(gameViewController, animated: true)
    }
}
