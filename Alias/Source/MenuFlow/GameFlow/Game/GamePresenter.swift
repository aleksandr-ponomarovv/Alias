//
//  GamePresenter.swift
//  Alias
//
//  Created by Aleksandr on 30.03.2022.
//

import UIKit

protocol GamePresenterType {
    var numberOfCards: Int { get }
    var timerSeconds: Int { get }
    var timerInterval: Double { get }
    var totalScoreText: String { get }
    func viewDidAppear()
    func skipWord()
    func guessWord()
    func getKolodaView(viewForCardAt index: Int) -> UIView
}

class GamePresenter: GamePresenterType {
    
    private let interactor: GameInteractorType
    private let router: GameRouterType
    private weak var view: GameViewType?
    
    var numberOfCards: Int {
        interactor.words.count
    }
    
    var timerSeconds: Int {
        60
    }
    
    var timerInterval: Double {
        1
    }
    
    var totalScoreText: String {
        let score = interactor.totalScrore
        let isNegativeScore = score < 0
        var totalText = "Total score:"
        totalText.append(isNegativeScore ? "" : " ")
        return "\(totalText)   \(score)"
    }
    
    init(interactor: GameInteractorType,
         router: GameRouterType,
         view: GameViewType) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidAppear() {
        view?.startTimer()
    }
    
    func skipWord() {
        interactor.updateScore(isGuessed: false)
        print("AP: totalScrore \(interactor.totalScrore)")
    }
    
    func guessWord() {
        interactor.updateScore(isGuessed: true)
        print("AP: totalScrore \(interactor.totalScrore)")
    }
    
    func getKolodaView(viewForCardAt index: Int) -> UIView {
        return CardView(word: interactor.words[index])
    }
}
