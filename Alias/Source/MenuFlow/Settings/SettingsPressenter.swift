//
//  SettingsPressenter.swift
//  Alias
//
//  Created by Aleksandr on 22.05.2022.
//

import Foundation

protocol SettingsPresenterType {}

class SettingsPresenter: SettingsPresenterType {
    
    private let interactor: SettingsInteractorType
    private let router: SettingsRouterType
    private weak var view: SettingsViewType?
    
    init(interactor: SettingsInteractorType,
         router: SettingsRouterType,
         view: SettingsViewType) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
