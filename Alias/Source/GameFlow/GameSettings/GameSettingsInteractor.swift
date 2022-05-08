//
//  GameSettingsInteractor.swift
//  Alias
//
//  Created by Aleksandr on 24.04.2022.
//

import Foundation

protocol GameSettingsInteractorType {
    var timeIntervals: [Int] { get }
    var wordsCounts: [Int] { get }
    var timeIntervalSelectedRow: Int { get set }
    var wordsCountSelectedRow: Int { get set }
}

class GameSettingsInteractor: GameSettingsInteractorType {
    
    var timeIntervalSelectedRow: Int = 3
    var wordsCountSelectedRow: Int = 13
    
    let timeIntervals: [Int] = {
        let step = 10       // seconds
        let minCount = 3    // if step = 10, min 30 seconds
        let maxCount = 60   // if step = 10, max 10 minutes
        return (0..<maxCount - minCount).map { minCount * step + $0 * step }
    }()
    
    let wordsCounts: [Int] = {
        let firstPart = (0..<10).map { 10 + $0 }        // 10,11,..,20
        let secondPart = (0..<19).map { 20 + $0 * 10 }  // 30,40,..,200
        return firstPart + secondPart
    }()
    
    init() {}
    
}
