//
//  PopoverViewControllerCoordinator.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 01.02.2021.
//

import UIKit

class PopoverViewControllerCoordinator: Coordinator {
    //        guard let popVC = storyboard?.instantiateViewController(identifier: historyViewModel.constants.identifierForPopover) as? PopoverViewController else { return  }
    //        popVC.modalPresentationStyle =  .popover
    //        let popOverVC = popVC.popoverPresentationController
    //        popOverVC?.delegate = self
    //        popOverVC?.barButtonItem = navigationItem.rightBarButtonItem
    //        popVC.preferredContentSize = CGSize(width: 350, height: 150)
    //        popVC.delegate = self
    //        self.present(popVC, animated: true)
    
    private let presenter: UINavigationController
    private var popoverViewController: PopoverViewController?
    private var historyViewController: HistoryViewController?
    private var navigationIt: UINavigationItem?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let popoverViewController = PopoverViewController(nibName: "PopoverVC", bundle: nil)
        //popoverViewController.delegate = self
        popoverViewController.modalPresentationStyle = .popover
        let popOverVC = popoverViewController.popoverPresentationController
        popOverVC?.delegate = historyViewController
        popOverVC?.barButtonItem = navigationIt?.rightBarButtonItem
        popoverViewController.preferredContentSize = CGSize(width: 350, height: 150)
        popoverViewController.delegate = historyViewController
        
        presenter.present(popoverViewController, animated: true, completion: nil)
       // presenter.pushViewController(popoverViewController, animated: true)
        self.popoverViewController = popoverViewController
    }
    
    
}
