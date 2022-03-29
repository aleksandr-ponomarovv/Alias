//
//  MainRouter.swift
//  Alias
//
//  Created by Aleksandr on 30.03.2022.
//

import Foundation

protocol MainRouterType {
    
}

class MainRouter: MainRouterType {
    
    private weak var viewController: MainViewController?
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
}
