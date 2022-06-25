//
//  MenuViewController.swift
//  Alias
//
//  Created by Aleksandr on 17.04.2022.
//

import UIKit

protocol MenuViewType: AnyObject {}

class MenuViewController: UIViewController {
    
    @IBOutlet private weak var playView: UIView!
    @IBOutlet private weak var playImageView: UIImageView!
    @IBOutlet private weak var playButton: UIButton!
    
    @IBOutlet private weak var infoButton: UIButton!
    @IBOutlet private weak var settingsButton: UIButton!
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    var presenter: MenuPresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction private func didTapPlayButton(_ sender: UIButton) {
        presenter?.didTapPlayButton()
    }
    
    @IBAction private func didTapInfoButton(_ sender: UIButton) {
        presenter?.didTapInfoButton()
        
    }
    
    @IBAction private func didTapSettingsButton(_ sender: UIButton) {
        presenter?.didTapSettingsButton()
    }
}

// MARK: - MenuViewType
extension MenuViewController: MenuViewType {}

extension MenuViewController: ModalViewControllerDelegate {
    func modalViewControllerContentView(_ modalViewController: ModalViewController) -> UIView {
        return infoLabel
    }
}

// MARK: - Private methods
private extension MenuViewController {
    func configureUI() {
        localizeUI()
        NotificationCenter.default.addObserver(self, selector: #selector(localizeUI), name: .languageChange, object: nil)
    }
    
    @objc func localizeUI() {
        infoLabel.text = Localizable.menuModalInfo.key.localized()
    }
}
