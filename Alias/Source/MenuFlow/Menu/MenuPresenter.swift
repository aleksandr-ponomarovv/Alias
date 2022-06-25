//
//  MainPresenter.swift
//  Alias
//
//  Created by Aleksandr on 17.04.2022.
//

import Foundation

protocol MenuPresenterType {
    func didTapPlayButton()
    func didTapSettingsButton()
    func didTapInfoButton()
}

class MenuPresenter: MenuPresenterType {
    
    private let interactor: MenuInteractorType
    private let router: MenuRouterType
    private weak var view: MenuViewType?
    
    init(interactor: MenuInteractorType,
         router: MenuRouterType,
         view: MenuViewType) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func didTapPlayButton() {
        router.pushGameSettingsScreen()
    }
    
    func didTapSettingsButton() {
        router.pushSettingsScreen()
    }
    
    func didTapInfoButton() {
        router.presentInfoModalScreen()
    }
}
