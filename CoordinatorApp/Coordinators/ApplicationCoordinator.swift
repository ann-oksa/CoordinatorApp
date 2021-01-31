//
//  ApplicationCoordinator.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 28.01.2021.
//

import UIKit

class ApplicationCoordinator: Coordinator {
   // let kanjiStorage: KanjiStorage
    let window: UIWindow
    let rootViewController : UINavigationController
    let translationViewControllerCoordinator: TranslationViewControllerCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        
       // kanjiStorage = KanjiStorage()
        //allKanjiListCoordinator = AllKanjiListCoordinator(presenter: rootViewController, kanjiStorage: kanjiStorage)
        translationViewControllerCoordinator = TranslationViewControllerCoordinator(presenter: rootViewController)

    }
    
    
    func start() {
        window.rootViewController = rootViewController
        translationViewControllerCoordinator.start()
        window.makeKeyAndVisible()
    }
    
}
