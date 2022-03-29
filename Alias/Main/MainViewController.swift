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
    private var configurator: MainConfiguratorType = MainConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let v1 = UIView()
        v1.backgroundColor = .blue
        let v3 = UIView()
        v3.backgroundColor = .yellow
        let v2 = UIView()
        v2.backgroundColor = .purple
        views.append(v1)
        views.append(v2)
        views.append(v3)
        
        view.backgroundColor = .red
        kolodaView.delegate = self
        kolodaView.dataSource = self
        modalTransitionStyle = .flipHorizontal
    }
}

// MARK: - MainViewType

extension MainViewController: MainViewType {
    
}


// MARK: - KolodaViewDelegate

extension MainViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
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
}
