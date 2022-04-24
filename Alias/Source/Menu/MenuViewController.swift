//
//  MenuViewController.swift
//  Alias
//
//  Created by Aleksandr on 17.04.2022.
//

import UIKit

protocol MenuViewType: AnyObject {
}

class MenuViewController: UIViewController {
    @IBOutlet private weak var playView: UIView!
    @IBOutlet private weak var playImageView: UIImageView!
    @IBOutlet private weak var playButton: UIButton!
    
    @IBOutlet private weak var infoView: UIView!
    @IBOutlet private weak var infoImageView: UIImageView!
    @IBOutlet private weak var infoButton: UIButton!
    
    @IBOutlet private weak var settingsView: UIView!
    @IBOutlet private weak var settingsImageView: UIImageView!
    @IBOutlet private weak var settingsButton: UIButton!
    
    var presenter: MenuPresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    @IBAction func didTapPlayButton(_ sender: UIButton) {
        print("OP: didTapPlayButton")
    }
    
    @IBAction func didTapInfoButton(_ sender: UIButton) {
        let label = UILabel()
        label.text = """
The game is divided into turns of about one minute of length. The teams play in turns,
and on each team's turn, one of the team members has to explain words on word cards to the other team members.
The other team members take guesses at the word, and words that have been correctly guessed earn the team one point per word.
Explanation mistakes (meaning the explainer uses the word to be explained, part of it, or a derivative of it),
and words passed over without being guessed take points away. The players move on the board as many places
as they have earned points on their turn.
"""
        label.numberOfLines = 0
        let modalViewController = ModalViewController(contentView: label)
        present(modalViewController, animated: false)
    }
    
    @IBAction func didTapSettingsButton(_ sender: UIButton) {
    }
}

// MARK: - MenuViewType
extension MenuViewController: MenuViewType {
}

// MARK: - Private methods
private extension MenuViewController {
    func configureUI() {
    }
}
