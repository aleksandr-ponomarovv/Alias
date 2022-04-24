//
//  GameViewController.swift
//  Alias
//
//  Created by Aleksandr on 22.03.2022.
//

import UIKit
import Koloda

protocol GameViewType: AnyObject {
    func startTimer()
}

class GameViewController: UIViewController {
    @IBOutlet private weak var timerView: TimerView!
    @IBOutlet private weak var kolodaView: KolodaView!
    @IBOutlet private weak var totalScoreLabel: UILabel!
    @IBOutlet private weak var skipButton: UIButton!
    @IBOutlet private weak var guessButton: UIButton!
    
    var presenter: GamePresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.viewDidAppear()
    }
    
    @IBAction func didTapSkipButton(_ sender: UIButton) {
        kolodaView?.swipe(.left)
    }
    
    @IBAction func didTapGuessButton(_ sender: UIButton) {
        kolodaView?.swipe(.right)
    }
}

// MARK: - GameViewType
extension GameViewController: GameViewType {
    func startTimer() {
        guard let presenter = presenter else { return }
        
        timerView.start(beginingValue: presenter.timerSeconds, interval: presenter.timerInterval)
    }
}

// MARK: - KolodaViewDelegate
extension GameViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        switch direction {
        case .left, .topLeft, .bottomLeft:
            presenter?.skipWord()
        case .right, .topRight, .bottomRight:
            presenter?.guessWord()
        case .up, .down:
            break
        }
        totalScoreLabel.text = presenter?.totalScoreText
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        print("AP: didSelectCardAt \(index)")
    }
}

// MARK: - KolodaViewDataSource
extension GameViewController: KolodaViewDataSource {
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return presenter?.numberOfCards ?? 0
    }
    
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.left, .topLeft, .bottomLeft, .right, .topRight, .bottomRight]
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return presenter?.getKolodaView(viewForCardAt: index) ?? .init()
    }
    
    func kolodaShouldApplyAppearAnimation(_ koloda: KolodaView) -> Bool {
        return false
    }
    
    func kolodaShouldTransparentizeNextCard(_ koloda: KolodaView) -> Bool {
        return false
    }
    
    func kolodaSwipeThresholdRatioMargin(_ koloda: KolodaView) -> CGFloat? {
        return 0.5
    }
}

// MARK: - Private methods
private extension GameViewController {
    func configureUI() {
        totalScoreLabel.text = presenter?.totalScoreText
        configureKolodaView()
        configureTimerView()
        configureSkipButton()
        configureRightButton()
    }
    
    func configureKolodaView() {
        kolodaView.delegate = self
        kolodaView.dataSource = self
    }
    
    func configureTimerView() {
        timerView.labelFont = .systemFont(ofSize: 18)
        timerView.labelTextColor = .black
        timerView.lineWidth = 4
    }
    
    func configureSkipButton() {
        skipButton.layer.cornerRadius = skipButton.bounds.height / 2
        skipButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        skipButton.layer.cornerCurve = .continuous
        skipButton.backgroundColor = .red
        skipButton.tintColor = .white
    }
    
    func configureRightButton() {
        guessButton.layer.cornerRadius = guessButton.bounds.height / 2
        guessButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        guessButton.layer.cornerCurve = .continuous
        guessButton.backgroundColor = .green
        guessButton.tintColor = .white
    }
}
