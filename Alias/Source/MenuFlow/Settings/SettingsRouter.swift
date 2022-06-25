//
//  SettingsRouter.swift
//  Alias
//
//  Created by Aleksandr on 22.05.2022.
//

import Foundation

protocol SettingsRouterType {}

class SettingsRouter: SettingsRouterType {
    
    private weak var viewController: SettingsViewController?
    
    init(viewController: SettingsViewController) {
        self.viewController = viewController
    }
}
