//
//  ApplicationCoordinator.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 28.01.2021.
//

import UIKit

class ApplicationCoordinator: Coordinator {
   
    let window: UIWindow
    let rootViewController : UINavigationController
    let translationViewControllerCoordinator: TranslationViewControllerCoordinator
    let appState: AppState
    
    init(window: UIWindow, appState: AppState) {
        self.window = window
        self.appState = appState
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        translationViewControllerCoordinator = TranslationViewControllerCoordinator(presenter: rootViewController, appState: appState)

    }
    
    func start() {
        window.rootViewController = rootViewController
        translationViewControllerCoordinator.start()
        window.makeKeyAndVisible()
    }
    
}
