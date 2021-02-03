//
//  GameViewControllerCoordinator.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 31.01.2021.
//

import UIKit

class GameViewControllerCoordinator: Coordinator, GameViewControllerDelegate {
 
    
    
    private let presenter: UINavigationController
    private var gameViewController: GameViewController?
    private var translationViewControllerCoordinator: TranslationViewControllerCoordinator?
    private var appState: AppState
    
    init(presenter: UINavigationController, appState: AppState) {
        self.presenter = presenter
        self.appState = appState
    }
    
    
    func start() {
        let viewModel = GameViewModel(appState: appState)
        let gameViewController  = GameViewController(viewModel: viewModel)
        gameViewController.delegate = self
        gameViewController.title = "Game"
        presenter.pushViewController(gameViewController, animated: true)
        self.gameViewController = gameViewController
    }
    
    func toTranslationVCClicked() {
        presenter.popViewController(animated: true)
    }
    
    
}
