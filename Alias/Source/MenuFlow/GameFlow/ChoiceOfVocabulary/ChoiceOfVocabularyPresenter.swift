//
//  ChoiceOfVocabularyPresenter.swift
//  Alias
//
//  Created by Aleksandr on 15.05.2022.
//

import Foundation

protocol ChoiceOfVocabularyPresenterType {}

class ChoiceOfVocabularyPresenter: ChoiceOfVocabularyPresenterType {
    
    private let interactor: ChoiceOfVocabularyInteractorType
    private let router: ChoiceOfVocabularyRouterType
    private weak var view: ChoiceOfVocabularyViewType?
    
    init(interactor: ChoiceOfVocabularyInteractorType,
         router: ChoiceOfVocabularyRouterType,
         view: ChoiceOfVocabularyViewType) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
