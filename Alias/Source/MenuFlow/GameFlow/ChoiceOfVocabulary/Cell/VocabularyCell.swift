//
//  VocabularyCell.swift
//  Alias
//
//  Created by Aleksandr on 15.05.2022.
//

import UIKit

class VocabularyCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    var vocabulary: Vocabulary? {
        willSet (model) {
            titleLabel.text = model?.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
