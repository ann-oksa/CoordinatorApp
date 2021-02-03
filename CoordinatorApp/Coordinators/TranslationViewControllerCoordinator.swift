//
//  TranslationVCCoordinator.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 28.01.2021.
//

import UIKit

class TranslationViewControllerCoordinator: Coordinator, TranslationViewControllerDelegate {
  
    private let presenter: UINavigationController
    private var translationViewController: TranslationViewController?
    private var historyViewControllerCoordinator: HistoryViewControllerCoordinator?
    private var gameViewControllerCoordinator: GameViewControllerCoordinator?
    private var appState: AppState
    
    init(presenter: UINavigationController, appState: AppState) {
        self.presenter = presenter
        self.appState = appState
    }

    func start() {
        // we can`t make view controller without view model
        let viewModel = TranslationViewModel(appState: appState)
        let translationViewController  = TranslationViewController(viewModel: viewModel)
        translationViewController.delegate = self
        presenter.pushViewController(translationViewController, animated: true)
        self.translationViewController = translationViewController
    }
    
    func toHistoryVCClicked() {
        let historyViewControllerCoordinator = HistoryViewControllerCoordinator(presenter: presenter, appState: appState)
        historyViewControllerCoordinator.start()
        self.historyViewControllerCoordinator = historyViewControllerCoordinator
    }
    
    func toGameVCClicked() {
        let gameViewControllerCoordinator = GameViewControllerCoordinator(presenter: presenter, appState: appState)
        gameViewControllerCoordinator.start()
        self.gameViewControllerCoordinator = gameViewControllerCoordinator
    }
}
