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
    
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let translationViewController  = TranslationViewController(nibName: "TranslationVC", bundle: nil)
        translationViewController.delegate = self
        presenter.pushViewController(translationViewController, animated: true)
        self.translationViewController = translationViewController
    }
    
    func toHistoryVCClicked() {
        let historyViewControllerCoordinator = HistoryViewControllerCoordinator(presenter: presenter)
        historyViewControllerCoordinator.start()
        self.historyViewControllerCoordinator = historyViewControllerCoordinator
    }
    
    func toGameVCClicked() {
        let gameViewControllerCoordinator = GameViewControllerCoordinator(presenter: presenter)
        gameViewControllerCoordinator.start()
        self.gameViewControllerCoordinator = gameViewControllerCoordinator
    }
    
    
    
}
