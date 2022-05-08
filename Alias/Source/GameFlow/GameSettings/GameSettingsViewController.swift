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
    
    @IBOutlet private weak var timeIntervalTextField: TextFieldPicker!
    
    @IBOutlet private weak var wordsCountTextField: TextFieldPicker!
    
    @IBOutlet private var stackViews: [UIView]!
    
    @IBOutlet weak var contentView: UIView!
    
    var presenter: GameSettingsPresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
}

// MARK: - GameSettingsViewType
extension GameSettingsViewController: GameSettingsViewType {

}

// MARK: - TextFieldPickerDelegate
extension GameSettingsViewController: TextFieldPickerDelegate {
    func textFieldPicker(_ textFieldPicker: TextFieldPicker, numberOfRowsInComponent component: Int) -> Int {
        guard let presenter = presenter else { return 0 }
        switch textFieldPicker {
        case timeIntervalTextField:
            return presenter.timeIntervals.count
        case wordsCountTextField:
            return presenter.wordsCounts.count
        default:
            return 0
        }
    }
    
    func textFieldPicker(_ textFieldPicker: TextFieldPicker, titleForRow row: Int, forComponent component: Int) -> String? {
        switch textFieldPicker {
        case timeIntervalTextField:
            return presenter?.timeIntervalTextField(titleForRow: row)
        case wordsCountTextField:
            return presenter?.wordsCountTextField(titleForRow: row)
        default:
            return nil
        }
    }
    
    func textFieldPickerDidTapDone(_ textFieldPicker: TextFieldPicker) {
        selectTimeInterval(textFieldPicker: textFieldPicker)
        textFieldPicker.resignFirstResponder()
    }
}

// MARK: - Private methods with TextField
private extension GameSettingsViewController {
    func selectTimeInterval(textFieldPicker: TextFieldPicker) {
        guard let presenter = presenter else { return }
        let selectedRow = textFieldPicker.selectedRow
        switch textFieldPicker {
        case timeIntervalTextField:
            textFieldPicker.text = presenter.timeIntervalTextField(titleForRow: selectedRow)
            presenter.timeIntervalTextField(didSelectRow: selectedRow)
        case wordsCountTextField:
            textFieldPicker.text = presenter.wordsCountTextField(titleForRow: selectedRow)
            presenter.wordsCountTextField(didSelectRow: selectedRow)
        default:
            break
        }
    }
}

// MARK: - Private methods setup UI
private extension GameSettingsViewController {
    func configureUI() {
        setupTimeTextField()
        setupStackViews()
        localizeUI()
    }
    
    func setupTimeTextField() {
        guard let presenter = presenter else { return }
        timeIntervalTextField.toolbarDelegate = self
        wordsCountTextField.toolbarDelegate = self
        timeIntervalTextField.selectRow(presenter.timeIntervalSelectedRow)
        wordsCountTextField.selectRow(presenter.wordsCountSelectedRow)
        selectTimeInterval(textFieldPicker: timeIntervalTextField)
        selectTimeInterval(textFieldPicker: wordsCountTextField)
    }
    
    func setupStackViews() {
        stackViews.forEach { view in
            view.layer.borderWidth = UIConstants.borderWidth
            view.layer.borderColor = R.color.border_cardView()?.cgColor
            view.layer.cornerCurve = .continuous
            view.layer.cornerRadius = 10
        }
    }
    
    func localizeUI() {
        timeIntervalTextField.title = "Timer"
        wordsCountTextField.title = "Word count"
    }
}
