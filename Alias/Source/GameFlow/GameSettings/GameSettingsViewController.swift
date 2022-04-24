//
//  GameSettingsViewController.swift
//  Alias
//
//  Created by Aleksandr on 24.04.2022.
//

import UIKit

protocol GameSettingsViewType: AnyObject {
    
}

class GameSettingsViewController: UIViewController {
    
    var presenter: GameSettingsPresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
}

// MARK: - GameSettingsViewType
extension GameSettingsViewController: GameSettingsViewType {
}

// MARK: - Private methods
private extension GameSettingsViewController {
    func configureUI() {
    }
}
