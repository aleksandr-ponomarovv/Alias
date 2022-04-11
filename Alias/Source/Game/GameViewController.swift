//
//  MainViewController.swift
//  Alias
//
//  Created by Aleksandr on 22.03.2022.
//

import UIKit
import Koloda

protocol GameViewType: AnyObject {
    
}

class GameViewController: UIViewController {
    
    @IBOutlet private weak var timerView: TimerView!
    @IBOutlet private weak var kolodaView: KolodaView!
    @IBOutlet private weak var skipButton: UIButton!
    @IBOutlet private weak var rightButton: UIButton!
    
    var presenter: GamePresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    @IBAction func didTapSkipButton(_ sender: UIButton) {
        kolodaView?.swipe(.left)
    }
    
    
    @IBAction func didTapRightButton(_ sender: UIButton) {
        kolodaView?.swipe(.right)
    }
    
    @IBAction func didTapRestartButton(_ sender: UIButton) {
        timerView.start(beginingValue: 3, interval: 1)
    }
}

// MARK: - MainViewType

extension GameViewController: GameViewType {
    
}


// MARK: - KolodaViewDelegate

extension GameViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        switch direction {
        case .left:
            print("AP: -1")
        case .right:
            print("AP: +1")
        case .up, .down, .topLeft, .topRight, .bottomLeft, .bottomRight:
            print("AP: default")
        }
        
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
        configureKolodaView()
        configureTimerView()
        configureSkipButton()
        configureRightButton()
        
        kolodaView.reloadData()
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
        rightButton.layer.cornerRadius = rightButton.bounds.height / 2
        rightButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        rightButton.layer.cornerCurve = .continuous
        rightButton.backgroundColor = .green
        rightButton.tintColor = .white
    }
}
