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
    private var appState: AppState
    
    init(presenter: UINavigationController, record: Record, appState: AppState) {
        self.presenter = presenter
        self.record = record
        self.appState = appState
    }
    
    func start() {
        let viewModel = DetailsViewModel(newChosenRecord: Record(word1: "", word2: ""), appState: appState)
        let detailsViewController = DetailsViewController(viewModel: viewModel)
        detailsViewController.delegate = self
        detailsViewController.detailsViewModel = DetailsViewModel(newChosenRecord: record, appState: appState)
        presenter.pushViewController(detailsViewController, animated: true)
        self.detailsViewController = detailsViewController
    }
    
    func toHistoryVCClicked() {
        presenter.popViewController(animated: true)
    }
    
    
    
    
}
