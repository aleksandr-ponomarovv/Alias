//
//  AliasNavigationController.swift
//  Alias
//
//  Created by Aleksandr on 16.05.2022.
//

import UIKit

class AliasNavigationController: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
        navigationBar.prefersLargeTitles = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        let pushingVC = viewControllers.last
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        pushingVC?.navigationItem.backBarButtonItem = backItem
        super.pushViewController(viewController, animated: animated)
    }
}
