//
//  GameSettingsPresenter.swift
//  Alias
//
//  Created by Aleksandr on 24.04.2022.
//

import Foundation

protocol GameSettingsPresenterType {
    
}

class GameSettingsPresenter: GameSettingsPresenterType {
    private let interactor: GameSettingsInteractorType
    private let router: GameSettingsRouterType
    private weak var view: GameSettingsViewType?
    
    init(interactor: GameSettingsInteractorType,
         router: GameSettingsRouterType,
         view: GameSettingsViewType) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
