//
//  MenuConfigurator.swift
//  Alias
//
//  Created by Aleksandr on 17.04.2022.
//

import Foundation

protocol MenuConfiguratorType {
    func configure(viewController: MenuViewController)
}

class MenuConfigurator: MenuConfiguratorType {
    
    func configure(viewController: MenuViewController) {
        let interactor = MenuInteractor()
        let router = MenuRouter(viewController: viewController)
        let presenter = MenuPresenter(interactor: interactor, router: router, view: viewController)
        viewController.presenter = presenter
    }
}
