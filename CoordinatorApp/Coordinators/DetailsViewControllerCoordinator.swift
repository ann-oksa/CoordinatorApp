//
//  DetailsViewControllerCoordinator.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 31.01.2021.
//

import UIKit

class DetailsViewControllerCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var detailsViewController: DetailsViewController?
    private var historyViewController: HistoryViewController?
    private var recordAtIndexPath: IndexPath
    
    
    init(presenter: UINavigationController, recordAtIndexPath: IndexPath) {
        self.presenter = presenter
        self.recordAtIndexPath = recordAtIndexPath
    }
    
    func start() {
        let detailsViewController = DetailsViewController(nibName: "DetailVC", bundle: nil)
        //detailsViewController.delegate = self
        //            destinationVC.detailsViewModel = DetailsViewModel(newChosenRecord: historyViewModel.chosenRecord!)
        detailsViewController.
        presenter.pushViewController(detailsViewController, animated: true)
        self.detailsViewController = detailsViewController
    }
    
    
}
