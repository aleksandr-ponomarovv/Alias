//
//  GameSettingsRouter.swift
//  Alias
//
//  Created by Aleksandr on 24.04.2022.
//

import Foundation

protocol GameSettingsRouterType {
    func openChoiceOfVocabularyScreen()
    func openGameScreen()
}

class GameSettingsRouter: GameSettingsRouterType {
    
    private weak var viewController: GameSettingsViewController?
    
    init(viewController: GameSettingsViewController) {
        self.viewController = viewController
    }
    
    func openChoiceOfVocabularyScreen() {
        let choiceOfVocabularyViewController = ChoiceOfVocabularyViewController()
        let configurator = ChoiceOfVocabularyConfigurator()
        configurator.configure(viewController: choiceOfVocabularyViewController)
        viewController?.navigationController?.pushViewController(choiceOfVocabularyViewController, animated: true)
    }
    
    func openGameScreen() {
        let gameViewController = GameViewController()
        let configurator = GameConfigurator()
        configurator.configure(viewController: gameViewController)
        viewController?.navigationController?.pushViewController(gameViewController, animated: true)
    }
}
