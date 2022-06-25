//
//  ChoiceOfVocabularyRouter.swift
//  Alias
//
//  Created by Aleksandr on 15.05.2022.
//

import Foundation

protocol ChoiceOfVocabularyRouterType {}

class ChoiceOfVocabularyRouter: ChoiceOfVocabularyRouterType {
    
    private weak var viewController: ChoiceOfVocabularyViewController?
    
    init(viewController: ChoiceOfVocabularyViewController) {
        self.viewController = viewController
    }
}
