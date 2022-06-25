//
//  Game.swift
//  Alias
//
//  Created by Aleksandr on 10.04.2022.
//

import Foundation

protocol GameDelegate: AnyObject {
    func gameDidEnd(_ game: Game)
}

extension GameDelegate {
    func gameDidEnd(_ game: Game) {}
}

class Game {
    
    weak var delegate: GameDelegate?
    
    let teams: [Team]
    
    private let vocabulary: [String]
    private var playingVocabulary: [String]
    private let pointsToWin: Int
    private var round: Int = 1
    
    var currentTeam: Team? {
        teams.first { $0.roundPoints == nil }
    }
    
    var isFinishRound: Bool {
        teams.allSatisfy { $0.roundPoints != nil }
    }
    
    var words: [String] {
        playingVocabulary
    }
    
    private var isGameOver: Bool {
        teams.contains { $0.totalPoints >= pointsToWin }
    }
    
    init(teams: [Team], pointsToWin: Int, vocabulary: [String]) {
        self.teams = teams
        self.pointsToWin = pointsToWin
        self.vocabulary = vocabulary
        self.playingVocabulary = vocabulary.shuffled()
    }
    
    func finishAnswers(for team: Team, skippedWords: Int, guessedWords: Int) {
        team.roundPoints = guessedWords - skippedWords
        let countPlayedWords = guessedWords + skippedWords
        restructurePlayingVocabulary(countPlayedWords: countPlayedWords)
    }
    
    func finishRound() {
        round += 1
        teams.forEach { team in
            team.totalPoints += team.roundPoints ?? 0
            team.roundPoints = nil
        }
        if isGameOver {
            delegate?.gameDidEnd(self)
        }
    }
}

// MARK: - Private methods
private extension Game {
    func restructurePlayingVocabulary(countPlayedWords: Int) {
        let playedWords = playingVocabulary.enumerated().filter { $0.offset < countPlayedWords }.map { $0.element }
        let otherWords = playingVocabulary.filter { !playedWords.contains($0) }
        playingVocabulary = otherWords + playedWords.shuffled()
    }
}
