//
//  GameSettingsRouter.swift
//  Alias
//
//  Created by Aleksandr on 24.04.2022.
//

import Foundation

protocol GameSettingsRouterType {
}

class GameSettingsRouter: GameSettingsRouterType {
    private weak var viewController: GameSettingsViewController?
    
    init(viewController: GameSettingsViewController) {
        self.viewController = viewController
    }
}
