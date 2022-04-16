//
//  GameRouter.swift
//  Alias
//
//  Created by Aleksandr on 30.03.2022.
//

import Foundation

protocol GameRouterType {
    
}

class GameRouter: GameRouterType {
    
    private weak var viewController: GameViewController?
    
    init(viewController: GameViewController) {
        self.viewController = viewController
    }
}
