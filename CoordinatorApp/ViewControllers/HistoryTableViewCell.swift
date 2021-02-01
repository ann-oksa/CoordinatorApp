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

    func bind(_ viewModel: CellForRecordViewModel) {
        wordLabel.text = viewModel.leftWord
        translationLabel.text = viewModel.rightWord
    }
    
}
