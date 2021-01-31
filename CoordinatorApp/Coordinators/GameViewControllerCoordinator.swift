//
//  GameViewControllerCoordinator.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 31.01.2021.
//

import UIKit

class GameViewControllerCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var gameViewController: GameViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    
    func start() {
        let gameViewController = GameViewController(nibName: "GameVC", bundle: nil)
        //gameViewController.delegate = self
        presenter.pushViewController(gameViewController, animated: true)
        self.gameViewController = gameViewController
    }
    
    
}
