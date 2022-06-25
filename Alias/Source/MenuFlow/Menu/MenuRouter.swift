//
//  MainRouter.swift
//  Alias
//
//  Created by Aleksandr on 17.04.2022.
//

import Foundation

protocol MenuRouterType {
    func pushGameSettingsScreen()
    func pushSettingsScreen()
    func presentInfoModalScreen()
}

class MenuRouter: MenuRouterType {
    
    private weak var viewController: MenuViewController?
    
    init(viewController: MenuViewController) {
        self.viewController = viewController
    }
    
    func pushGameSettingsScreen() {
        let gameViewController = GameSettingsViewController()
        let configurator: GameSettingsConfiguratorType = GameSettingsConfigurator()
        configurator.configure(viewController: gameViewController)
        viewController?.navigationController?.pushViewController(gameViewController, animated: true)
    }
    
    func pushSettingsScreen() {
        let settingsViewController = SettingsViewController()
        let configurator: SettingsConfiguratorType = SettingsConfigurator()
        configurator.configure(viewController: settingsViewController)
        viewController?.navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    func presentInfoModalScreen() {
        let modalViewController = ModalViewController()
        modalViewController.delegate = viewController
        viewController?.present(modalViewController, animated: false)
    }
}
