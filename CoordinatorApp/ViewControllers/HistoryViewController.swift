//
//  HistoryViewController.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 29.01.2021.
//

import UIKit

protocol HistoryViewControllerDelegate: class {
    func historyViewControllerDidSelectRecord(record: Record)
    func historyViewControllerDidSelectSortItem()
}

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate, SortPickerDelegate {
   
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    let historyViewModel = HistoryViewModel(records: AppState.shared.getRecords())
    var cellAccessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    weak var delegate: HistoryViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib  = UINib(nibName: "HistoryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.reloadData()
        let sortButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(openSortMenuForWordsInHistory))
        sortButton.tintColor = .black
        let switchTranslationButton = UIBarButtonItem(image: UIImage(systemName: "arrow.triangle.2.circlepath"), style: .plain, target: self, action: #selector(switchTranslationRuEn))
        switchTranslationButton.tintColor = .black
        
        navigationItem.rightBarButtonItems = [sortButton, switchTranslationButton]
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for record in historyViewModel.listOfCellViewModel {
            record.configure(isEnglishLanguageOnLeftSide: true)
            tableView.reloadData()
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            historyViewModel.removeChosenRecord(indexPath: indexPath)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    func selectSortingMethod(method: KindOfSorting) {
        historyViewModel.sortDictionary(method: method)
        tableView.reloadData()
    }
    
    @objc func switchTranslationRuEn(){
        historyViewModel.switchStateOfLanguage()
        tableView.reloadData()
    }
    
    @objc func openSortMenuForWordsInHistory() {
        print("show popover")
        delegate?.historyViewControllerDidSelectSortItem()
//        guard let popVC = storyboard?.instantiateViewController(identifier: historyViewModel.constants.identifierForPopover) as? PopoverViewController else { return  }
//        popVC.modalPresentationStyle =  .popover
//        let popOverVC = popVC.popoverPresentationController
//        popOverVC?.delegate = self
//        popOverVC?.barButtonItem = navigationItem.rightBarButtonItem
//        popVC.preferredContentSize = CGSize(width: 350, height: 150)
//        popVC.delegate = self
//        self.present(popVC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyViewModel.listOfCellViewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HistoryTableViewCell
        cell?.accessoryType = cellAccessoryType
        let cellViewModel = historyViewModel.listOfCellViewModel[indexPath.row]
        cell?.bind(cellViewModel)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        historyViewModel.selectRowToGo(indexPath: indexPath)
        delegate?.historyViewControllerDidSelectRecord(record: historyViewModel.chosenRecord ?? Record(word1: "", word2: ""))
        tableView.deselectRow(at: indexPath, animated: true)

    }


}
