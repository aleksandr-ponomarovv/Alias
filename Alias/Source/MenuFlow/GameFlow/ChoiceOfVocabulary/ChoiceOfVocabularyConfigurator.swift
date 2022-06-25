//
//  ChoiceOfVocabularyConfigurator.swift
//  Alias
//
//  Created by Aleksandr on 15.05.2022.
//

import Foundation

protocol ChoiceOfVocabularyConfiguratorType {
    func configure(viewController: ChoiceOfVocabularyViewController)
}

class ChoiceOfVocabularyConfigurator: ChoiceOfVocabularyConfiguratorType {
    
    func configure(viewController: ChoiceOfVocabularyViewController) {
        let interactor = ChoiceOfVocabularyInteractor()
        let router = ChoiceOfVocabularyRouter(viewController: viewController)
        let presenter = ChoiceOfVocabularyPresenter(interactor: interactor, router: router, view: viewController)
        viewController.presenter = presenter
    }
}
