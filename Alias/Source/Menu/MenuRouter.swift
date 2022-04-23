//
//  MainRouter.swift
//  Alias
//
//  Created by Aleksandr on 17.04.2022.
//

import Foundation

protocol MenuRouterType {
}

class MenuRouter: MenuRouterType {
    private weak var viewController: MenuViewController?
    
    init(viewController: MenuViewController) {
        self.viewController = viewController
    }
}
