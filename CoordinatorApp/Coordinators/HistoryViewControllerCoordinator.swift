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
    private var appState: AppState
    
    init(presenter: UINavigationController, appState: AppState) {
        self.presenter = presenter
        self.appState = appState
    }
    
    func start() {
        let viewModel = HistoryViewModel(records: appState.getRecords(), appState: appState)
        let historyViewController = HistoryViewController(viewModel: viewModel)
        historyViewController.delegate = self
        historyViewController.title = "History"
        presenter.pushViewController(historyViewController, animated: true)
        self.historyViewController = historyViewController
    }
    
    func historyViewControllerDidSelectRecord(record: Record) {
        let detailsViewControllerCooordinator = DetailsViewControllerCoordinator(presenter: presenter, record: record, appState: appState)
        detailsViewControllerCooordinator.start()
        self.detailsViewControllerCooordinator = detailsViewControllerCooordinator
    }
    
    func historyViewControllerDidSelectSortItem() {
        let popoverViewControllerCoordinator = PopoverViewControllerCoordinator(presenter: presenter, appState: appState)
        popoverViewControllerCoordinator.start()
        self.popoverViewControllerCoordinator = popoverViewControllerCoordinator
    }
}
