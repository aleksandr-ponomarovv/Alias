//
//  CardView.swift
//  Alias
//
//  Created by Aleksandr on 31.03.2022.
//

import UIKit

class CardView: UIView {
    
    private lazy var wordLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 42)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textColor = R.color.text_cardView()
        return label
    }()
    
    init(word: String) {
        super.init(frame: .zero)
        
        wordLabel.text = word
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
private extension CardView {
    func setupUI() {
        backgroundColor = R.color.bg_cardView()
        setupCorner()
        setupBorder()
        setupConstraints()
    }
    
    func setupBorder() {
        layer.borderWidth = UIConstants.borderWidth
        layer.borderColor = R.color.border_cardView()?.cgColor
    }
    
    func setupCorner() {
        layer.cornerCurve = .continuous
        layer.cornerRadius = 40
    }
    
    func setupConstraints() {
        addSubview(wordLabel)
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 12
        NSLayoutConstraint.activate([
            wordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            wordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            wordLabel.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }
}
