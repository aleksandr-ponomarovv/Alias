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
        label.font = .boldSystemFont(ofSize: 32)
        label.textAlignment = .center
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
        setupCorner()
        setupBorder()
        setupConstraints()
    }
    
    func setupBorder() {
        layer.borderWidth = 4
        layer.borderColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
    }
    
    func setupCorner() {
        layer.cornerCurve = .continuous
        layer.cornerRadius = 40
    }
    
    func setupConstraints() {
        addSubview(wordLabel)
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            wordLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            wordLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            wordLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
