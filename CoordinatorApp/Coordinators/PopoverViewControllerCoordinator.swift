//
//  PopoverViewControllerCoordinator.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 01.02.2021.
//

import UIKit

class PopoverViewControllerCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var popoverViewController: PopoverViewController?
    private var historyViewController: HistoryViewController?
    private var appState: AppState
    
    init(presenter: UINavigationController, appState: AppState) {
        self.presenter = presenter
        self.appState = appState
    }
    
    func start() {
        guard let topController : HistoryViewController = presenter.topViewController as? HistoryViewController else {
           print("PopoverViewControllerCoordinator -> start -> cannot create top controller as HistoryViewController")
            return
        }
        let viewModel = PopoverViewModel(appState: appState)
        let popoverViewController = PopoverViewController(viewModel: viewModel)
        popoverViewController.modalPresentationStyle = .popover
        let popOverVC = popoverViewController.popoverPresentationController
        popOverVC?.delegate = topController
        popOverVC?.barButtonItem = topController.navigationItem.rightBarButtonItem
        popoverViewController.preferredContentSize = CGSize(width: 350, height: 150)
        popoverViewController.delegate = topController
        presenter.topViewController?.present(popoverViewController, animated: true, completion: nil)
        self.popoverViewController = popoverViewController
    }
}
