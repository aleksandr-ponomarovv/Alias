//
//  GameSettingsConfigurator.swift
//  Alias
//
//  Created by Aleksandr on 24.04.2022.
//

import Foundation

protocol GameSettingsConfiguratorType {
    func configure(viewController: GameSettingsViewController)
}

class GameSettingsConfigurator: GameSettingsConfiguratorType {
    func configure(viewController: GameSettingsViewController) {
        let interactor = GameSettingsInteractor()
        let router = GameSettingsRouter(viewController: viewController)
        let presenter = GameSettingsPresenter(interactor: interactor, router: router, view: viewController)
        viewController.presenter = presenter
    }
}
