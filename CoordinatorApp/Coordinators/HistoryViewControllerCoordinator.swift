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
   // private var dictionary = Dictionary()
    private var detailsViewControllerCooordinator: DetailsViewControllerCoordinator?
    var data : [Record]
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        data = AppState.shared.getRecords()
    }
    
    func start() {
       let historyViewController = HistoryViewController(nibName: "HistoryVC", bundle: nil)
        historyViewController.delegate = self
        historyViewController.title = "History"
//        historyViewController.dictionary = data
      //  historyViewController.dict = data
        presenter.pushViewController(historyViewController, animated: true)
        self.historyViewController = historyViewController
    }
    
    func historyViewControllerDidSelectRecord(recordAtIndexPath: IndexPath) {
        let detailsViewControllerCooordinator = DetailsViewControllerCoordinator(presenter: presenter, recordAtIndexPath: recordAtIndexPath)
        detailsViewControllerCooordinator.start()
        self.detailsViewControllerCooordinator = detailsViewControllerCooordinator
    }
    
    
}
