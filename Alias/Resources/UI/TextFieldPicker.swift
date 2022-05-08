//
//  PickerView.swift
//  Alias
//
//  Created by Aleksandr on 05.05.2022.
//

import UIKit

protocol TextFieldPickerDelegate: AnyObject {
    func textFieldPicker(_ textFieldPicker: TextFieldPicker, numberOfRowsInComponent component: Int) -> Int
    func textFieldPicker(_ textFieldPicker: TextFieldPicker, titleForRow row: Int, forComponent component: Int) -> String?
    func textFieldPickerDidTapDone(_ textFieldPicker: TextFieldPicker)
    func textFieldPickerDidTapCancel(_ textFieldPicker: TextFieldPicker)
}

extension TextFieldPickerDelegate {
    func textFieldPickerDidTapDone(_ textFieldPicker: TextFieldPicker) { textFieldPicker.resignFirstResponder() }
    func textFieldPickerDidTapCancel(_ textFieldPicker: TextFieldPicker) { textFieldPicker.resignFirstResponder() }
}

class TextFieldPicker: UITextField {
    
    weak var toolbarDelegate: TextFieldPickerDelegate?
    
    private let toolbar = UIToolbar()
    private let pickerView = UIPickerView()
    private let numberOfComponents = 1
    private let inComponent = 0
    private let textPadding = UIEdgeInsets(top: 0, left: 112, bottom: 0, right: 12)
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .sectionBold
        return label
    }()
    
    var selectedRow: Int {
        pickerView.selectedRow(inComponent: inComponent)
    }
   
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .null
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    func selectRow(_ row: Int, animated: Bool = false) {
        pickerView.selectRow(row, inComponent: inComponent, animated: animated)
    }
}

// MARK: - UIPickerViewDataSource
extension TextFieldPicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return toolbarDelegate?.textFieldPicker(self, numberOfRowsInComponent: component) ?? 0
    }
}

// MARK: - UIPickerViewDelegate
extension TextFieldPicker: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return toolbarDelegate?.textFieldPicker(self, titleForRow: row, forComponent: component)
    }
}

// MARK: - Private methods
private extension TextFieldPicker {
    func commonInit() {
        setupPickerView()
        setupToolbar()
        setupToolbarButtons()
        setupTextField()
        setupTitleLabel()
    }
    
    func setupPickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    func setupToolbar() {
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        toolbar.isUserInteractionEnabled = true
    }
    
    func setupTextField() {
        tintColor = .clear
        textAlignment = .right
        font = .sectionBold
        inputView = pickerView
        inputAccessoryView = toolbar
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 100)])
    }
}

// MARK: - Private methods ToolbarButtons
private extension TextFieldPicker {
    func setupToolbarButtons() {
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
    }
    
    @objc func doneAction() {
        toolbarDelegate?.textFieldPickerDidTapDone(self)
    }
    
    @objc func cancelAction() {
        toolbarDelegate?.textFieldPickerDidTapCancel(self)
    }
}
