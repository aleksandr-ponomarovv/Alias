//
//  SettingsConfigurator.swift
//  Alias
//
//  Created by Aleksandr on 22.05.2022.
//

import Foundation

protocol SettingsConfiguratorType {
    func configure(viewController: SettingsViewController)
}

class SettingsConfigurator: SettingsConfiguratorType {
    
    func configure(viewController: SettingsViewController) {
        let interactor = SettingsInteractor()
        let router = SettingsRouter(viewController: viewController)
        let presenter = SettingsPresenter(interactor: interactor, router: router, view: viewController)
        viewController.presenter = presenter
    }
}
