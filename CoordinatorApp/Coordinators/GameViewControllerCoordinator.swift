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
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    
    func start() {
        let gameViewController = GameViewController(nibName: "GameVC", bundle: nil)
        gameViewController.delegate = self
        gameViewController.title = "Game"
        presenter.pushViewController(gameViewController, animated: true)
        self.gameViewController = gameViewController
    }
    
    func toTranslationVCClicked() {
        let translationViewControllerCoordinator = TranslationViewControllerCoordinator(presenter: presenter)
        translationViewControllerCoordinator.back()
        self.translationViewControllerCoordinator = translationViewControllerCoordinator
    }
    
    
}
