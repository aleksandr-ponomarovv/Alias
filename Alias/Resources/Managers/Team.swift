//
//  Team.swift
//  Alias
//
//  Created by Aleksandr on 24.04.2022.
//

import Foundation

class Team {
    
    let name: String
    var totalPoints: Int
    var roundPoints: Int?
    
    init(name: String, points: Int = 0) {
        self.name = name
        self.totalPoints = points
    }
}
