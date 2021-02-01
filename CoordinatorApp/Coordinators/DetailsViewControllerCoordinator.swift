//
//  DetailsViewControllerCoordinator.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 31.01.2021.
//

import UIKit

class DetailsViewControllerCoordinator: Coordinator, DetailsViewControllerDelegate {
   
    
  
    
    
    private let presenter: UINavigationController
    private var detailsViewController: DetailsViewController?
    private var historyViewController: HistoryViewController?
    private var historyViewControllerCoordinator: HistoryViewControllerCoordinator?
    private var record: Record
    
    
    init(presenter: UINavigationController, record: Record) {
        self.presenter = presenter
        self.record = record
    }
    
    func start() {
        let detailsViewController = DetailsViewController(nibName: "DetailVC", bundle: nil)
        detailsViewController.delegate = self
        detailsViewController.detailsViewModel = DetailsViewModel(newChosenRecord: record)
        presenter.pushViewController(detailsViewController, animated: true)
        self.detailsViewController = detailsViewController
    }
    
    func toHistoryVCClicked() {
        let historyViewControllerCoordinator = HistoryViewControllerCoordinator(presenter: presenter)
        historyViewControllerCoordinator.back()
        self.historyViewControllerCoordinator = historyViewControllerCoordinator
    }
    
    
    
    
}
