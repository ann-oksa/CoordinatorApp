//
//  HistoryViewController.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 29.01.2021.
//

import UIKit

protocol HistoryViewControllerDelegate: class {
    func historyViewControllerDidSelectRecord(record: Model)
}

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            
            
        }
    }
    
    
    
    var dictionary: [Model] = []
    var cellAccessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    weak var delegate: HistoryViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib  = UINib(nibName: "HistoryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionary.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HistoryTableViewCell
        let rec = dictionary[indexPath.row]
        cell?.wordLabel.text = rec.word
        cell?.translationLabel.text  = rec.translation
        cell?.accessoryType = cellAccessoryType
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let record = dictionary[indexPath.row]
        delegate?.historyViewControllerDidSelectRecord(record: record)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }


}
