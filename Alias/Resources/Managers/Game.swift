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
    
    private let teams: [String: Int]
    
    init(teams: [String: Int]) {
        self.teams = teams
    }
    
    func start() {
    }
}
