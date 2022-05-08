//
//  GameSettingsPresenter.swift
//  Alias
//
//  Created by Aleksandr on 24.04.2022.
//

import Foundation

protocol GameSettingsPresenterType {
    var timeIntervals: [Int] { get }
    var wordsCounts: [Int] { get }
    var timeIntervalSelectedRow: Int { get }
    var wordsCountSelectedRow: Int { get }
    
    func timeIntervalTextField(titleForRow row: Int) -> String
    func timeIntervalTextField(didSelectRow row: Int)
    func wordsCountTextField(titleForRow row: Int) -> String
    func wordsCountTextField(didSelectRow row: Int)
}

class GameSettingsPresenter: GameSettingsPresenterType {
    
    private var interactor: GameSettingsInteractorType
    private let router: GameSettingsRouterType
    private weak var view: GameSettingsViewType?
    
    var timeIntervals: [Int] {
        interactor.timeIntervals
    }
    
    var wordsCounts: [Int] {
        interactor.wordsCounts
    }
    
    var timeIntervalSelectedRow: Int {
        interactor.timeIntervalSelectedRow
    }
    
    var wordsCountSelectedRow: Int {
        interactor.wordsCountSelectedRow
    }
    
    init(interactor: GameSettingsInteractorType,
         router: GameSettingsRouterType,
         view: GameSettingsViewType) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func timeIntervalTextField(titleForRow row: Int) -> String {
        let min = timeIntervals[row].minutes
        let sec = timeIntervals[row].seconds
        if min == 0 {
            return "\(sec) sec"
        } else if sec == 0 {
            return "\(min) min"
        } else {
            return "\(min) min \(sec) sec"
        }
    }
    
    func timeIntervalTextField(didSelectRow row: Int) {
        interactor.timeIntervalSelectedRow = row
    }
    
    func wordsCountTextField(titleForRow row: Int) -> String {
        return "\(wordsCounts[row])"
    }
    
    func wordsCountTextField(didSelectRow row: Int) {
        interactor.wordsCountSelectedRow = row
    }
}
