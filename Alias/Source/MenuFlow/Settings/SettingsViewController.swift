//
//  SettingsViewController.swift
//  Alias
//
//  Created by Aleksandr on 16.05.2022.
//

import UIKit

protocol SettingsViewType: AnyObject {}

class SettingsViewController: UIViewController {

    @IBOutlet private weak var languageButton: UIButton!
    
    var presenter: SettingsPresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        NotificationCenter.default.addObserver(self, selector: #selector(localizeUI), name: .languageChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func didTapLanguageButton(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: nil, message: "Switch Language", preferredStyle: UIAlertController.Style.actionSheet)
        for language in Localize.shared.availableLanguages() {
            let displayName = Localize.shared.displayNameForLanguage(language)
            let languageAction = UIAlertAction(title: displayName, style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                    Localize.shared.setCurrentLanguage(language)
            })
            actionSheet.addAction(languageAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {
            (alert: UIAlertAction) -> Void in
        })
        actionSheet.addAction(cancelAction)
        self.present(actionSheet, animated: true, completion: nil)
    }
}

// MARK: - SettingsViewType
extension SettingsViewController: SettingsViewType {}

// MARK: - Private methods
private extension SettingsViewController {
    func configureUI() {
        localizeUI()
    }
    
    @objc func localizeUI() {
        title = "Settings"
        languageButton.setTitle(Localizable.settingsButtonLanguage.key.localized(), for: .normal)
    }
}
