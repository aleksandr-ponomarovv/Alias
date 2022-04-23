//
//  GameConfigurator.swift
//  Alias
//
//  Created by Aleksandr on 30.03.2022.
//

import Foundation

protocol GameConfiguratorType {
    func configure(viewController: GameViewController)
}

class GameConfigurator: GameConfiguratorType {
    func configure(viewController: GameViewController) {
        let interactor = GameInteractor()
        let router = GameRouter(viewController: viewController)
        let presenter = GamePresenter(interactor: interactor, router: router, view: viewController)
        viewController.presenter = presenter
    }
}
