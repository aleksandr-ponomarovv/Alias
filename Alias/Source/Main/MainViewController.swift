//
//  MainViewController.swift
//  Alias
//
//  Created by Aleksandr on 22.03.2022.
//

import UIKit
import Koloda

protocol MainViewType: AnyObject {
    
}

class MainViewController: UIViewController {
    
    @IBOutlet private weak var kolodaView: KolodaView!
    
    private var views: [UIView] = []
    
    var presenter: MainPresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        configureUI()
    }
}

// MARK: - MainViewType

extension MainViewController: MainViewType {
    
}


// MARK: - KolodaViewDelegate

extension MainViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        let position = kolodaView.currentCardIndex
        for i in 1...4 {
            let cardView = CardView(word: "Card \(i)")
            cardView.backgroundColor = .blue
            views.append(cardView)
        }
        kolodaView.insertCardAtIndexRange(position..<position + 4, animated: true)
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        print("AP: didSelectCardAt \(index)")
    }
}

// MARK: - KolodaViewDataSource

extension MainViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return views.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return views[index]
    }
    
    func kolodaShouldApplyAppearAnimation(_ koloda: KolodaView) -> Bool {
        false
    }
    
    func kolodaShouldTransparentizeNextCard(_ koloda: KolodaView) -> Bool {
        false
    }
    
    func kolodaSwipeThresholdRatioMargin(_ koloda: KolodaView) -> CGFloat? {
        return 0.5
    }
    
    //    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
    //        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
    //    }
}

// MARK: - Private methods
private extension MainViewController {
    func configureUI() {
        kolodaView.delegate = self
        kolodaView.dataSource = self
        modalTransitionStyle = .flipHorizontal
        
        let v1 = CardView(word: "first")
        v1.backgroundColor = .blue
        let v3 = CardView(word: "second")
        v3.backgroundColor = .yellow
        let v2 = CardView(word: "third")
        v2.backgroundColor = .purple
        views.append(v1)
        views.append(v2)
        views.append(v3)
        kolodaView.reloadData()
    }
}
