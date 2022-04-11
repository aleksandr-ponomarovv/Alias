//
//  MainPresenter.swift
//  Alias
//
//  Created by Aleksandr on 30.03.2022.
//

import UIKit

protocol GamePresenterType {
    var numberOfCards: Int { get }
    func getKolodaView(viewForCardAt index: Int) -> UIView
}

class GamePresenter: GamePresenterType {
    
    var numberOfCards: Int {
        interactor.words.count
    }
    
    private let interactor: GameInteractorType
    private let router: GameRouterType
    private weak var view: GameViewType?
    
    init(interactor: GameInteractorType,
         router: GameRouterType,
         view: GameViewType) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func getKolodaView(viewForCardAt index: Int) -> UIView {
        return CardView(word: interactor.words[index])
    }
}
