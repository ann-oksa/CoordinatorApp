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
    private var detailsViewControllerCooordinator: DetailsViewControllerCoordinator?
    private var popoverViewControllerCoordinator: PopoverViewControllerCoordinator?
    var data : [Record]
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        //self.presenterForPopover = presenterForPopover
        data = AppState.shared.getRecords()
    }
    
    func start() {
       let historyViewController = HistoryViewController(nibName: "HistoryVC", bundle: nil)
        historyViewController.delegate = self
        historyViewController.title = "History"
        presenter.pushViewController(historyViewController, animated: true)
        self.historyViewController = historyViewController
    }
    
    func historyViewControllerDidSelectRecord(record: Record) {
        let detailsViewControllerCooordinator = DetailsViewControllerCoordinator(presenter: presenter, record: record)
        detailsViewControllerCooordinator.start()
        self.detailsViewControllerCooordinator = detailsViewControllerCooordinator
    }
    
    func back() {
       let historyViewController = HistoryViewController(nibName: "HistoryVC", bundle: nil)
        historyViewController.delegate = self
        historyViewController.title = "History"
        presenter.popViewController(animated: true)
        self.historyViewController = historyViewController
    }
    
    func historyViewControllerDidSelectSortItem() {
        let popoverViewControllerCoordinator = PopoverViewControllerCoordinator(presenter: presenter)
        popoverViewControllerCoordinator.start()
        self.popoverViewControllerCoordinator = popoverViewControllerCoordinator
        
    }
    
    
}
