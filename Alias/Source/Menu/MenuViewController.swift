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
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var infoButton: UIButton!
    
    var presenter: MenuPresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    @IBAction func didTapPlayButton(_ sender: UIButton) {
        print("OP: didTapPlayButton")
    }
    
    @IBAction func didTapInfoButton(_ sender: UIButton) {
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
