//
//  MainInteractor.swift
//  Alias
//
//  Created by Aleksandr on 30.03.2022.
//

import Foundation

protocol GameInteractorType {
    var words: [String] { get }
}

class GameInteractor: GameInteractorType {
  
    let words: [String] = {
        var words: [String] = JsonReader.readLocalFile(for: .simpleDictionary) ?? []
        words.shuffle()
        return words
    }()
    
    init() {}
    
}
