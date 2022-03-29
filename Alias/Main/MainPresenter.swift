//
//  MainPresenter.swift
//  Alias
//
//  Created by Aleksandr on 30.03.2022.
//

import Foundation

protocol MainPresenterType {
    func viewDidLoad()
}

class MainPresenter: MainPresenterType {
    
    private var interactor: MainInteractorType
    private var router: MainRouterType
    private weak var view: MainViewType?
    
    init(interactor: MainInteractorType,
         router: MainRouterType,
         view: MainViewType) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        
    }
}
