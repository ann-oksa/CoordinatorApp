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
    
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let detailsViewController = DetailsViewController(nibName: "DetailVC", bundle: nil)
        //detailsViewController.delegate = self
        presenter.pushViewController(detailsViewController, animated: true)
        self.detailsViewController = detailsViewController
    }
    
    
}
