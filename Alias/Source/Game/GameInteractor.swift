//
//  GameInteractor.swift
//  Alias
//
//  Created by Aleksandr on 30.03.2022.
//

import Foundation

protocol GameInteractorType {
    var words: [String] { get }
    var totalScrore: Int { get }
    func updateScore(isGuessed: Bool)
}

class GameInteractor: GameInteractorType {
    private let point = 1
    private var skipScore = 0
    private var guessedScore = 0
    
    let words: [String] = {
        var words: [String] = JsonReader.readLocalFile(for: .simpleDictionary) ?? []
        words.shuffle()
        return words
    }()
    
    var totalScrore: Int {
        guessedScore - skipScore
    }
    
    init() {}
    
    func updateScore(isGuessed: Bool) {
        if isGuessed {
            guessedScore += point
        } else {
            skipScore += point
        }
    }
}
