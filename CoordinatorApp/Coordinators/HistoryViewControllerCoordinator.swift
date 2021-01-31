//
//  HistoryVCCoordinator.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 28.01.2021.
//

import UIKit

class HistoryViewControllerCoordinator  : Coordinator, HistoryViewControllerDelegate {
   
    
    
    private let presenter: UINavigationController
    private var historyViewController: HistoryViewController?
    private var dictionary = Dictionary()
    private var detailsViewControllerCooordinator: DetailsViewControllerCoordinator?
    var data : [Model]
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        data = dictionary.example
    }
    
    func start() {
       let historyViewController = HistoryViewController(nibName: "HistoryVC", bundle: nil)
        historyViewController.delegate = self
        historyViewController.title = "History"
        historyViewController.dictionary = data
        presenter.pushViewController(historyViewController, animated: true)
        self.historyViewController = historyViewController
    }
    
    func historyViewControllerDidSelectRecord(record: Model) {
        let detailsViewControllerCooordinator = DetailsViewControllerCoordinator(presenter: presenter)
        detailsViewControllerCooordinator.start()
        self.detailsViewControllerCooordinator = detailsViewControllerCooordinator
    }
    
    
}
