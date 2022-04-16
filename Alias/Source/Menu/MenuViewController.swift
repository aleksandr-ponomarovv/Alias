//
//  MenuViewController.swift
//  Alias
//
//  Created by Aleksandr on 17.04.2022.
//

import UIKit

protocol MenuViewType: AnyObject {
    
}

class MenuViewController: UIViewController {

    var presenter: MenuPresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
}

// MARK: - MenuViewType

extension MenuViewController: MenuViewType {
    
}

// MARK: - Private methods

private extension MenuViewController {
    func configureUI() {
        
    }
}
