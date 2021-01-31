//
//  HistoryTableViewCell.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 29.01.2021.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
