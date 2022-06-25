//
//  ChoiceOfVocabularyViewController.swift
//  Alias
//
//  Created by Aleksandr on 15.05.2022.
//

import UIKit

protocol ChoiceOfVocabularyViewType: AnyObject {}

class ChoiceOfVocabularyViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: ChoiceOfVocabularyPresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
}

// MARK: - ChoiceOfVocabularyViewType
extension ChoiceOfVocabularyViewController: ChoiceOfVocabularyViewType {
    
}

// MARK: - UITableViewDataSource
extension ChoiceOfVocabularyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return .init()
    }
}

// MARK: - Private methods
private extension ChoiceOfVocabularyViewController {
    func configureUI() {
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
    }
}
