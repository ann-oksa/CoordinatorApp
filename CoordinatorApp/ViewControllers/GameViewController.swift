//
//  GameViewController.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 31.01.2021.
//

import UIKit

protocol GameViewControllerDelegate: class {
    func toTranslationVCClicked()
}

class GameViewController: UIViewController, GameDelegate {

    @IBOutlet weak var buttonCard: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var buttonPrevious: UIButton!
    
    let gameViewModel = GameViewModel()
    weak var delegate: GameViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        gameViewModel.delegate =  self
        gameViewModel.setValueForNewGame()
        checkRecordsCountInHistory()
        
    }
    
    @IBAction func buttonFlip(_ sender: UIButton) {
        gameViewModel.buttonFlip()
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        gameViewModel.nextClicked()
        gameViewModel.chooseEnotherCard()
    }
    @IBAction func previousClicked(_ sender: UIButton) {
        gameViewModel.previousClicked()
        gameViewModel.chooseEnotherCard()
    }
    
    func setButtonCardTitleAndAction() {
        setTitleForButtonCard(with: gameViewModel.game.someCardTitle)
        buttonCard.backgroundColor = .white
        UIView.transition(with: buttonCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    func makeAlert() {
        let alert = UIAlertController(title: gameViewModel.learnAllWords, message: gameViewModel.doYouWantToPlayAgain, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: gameViewModel.cancel, style: .cancel, handler: nil)
        let okButton = UIAlertAction(title: gameViewModel.ok, style: .default) { (action) in
            self.gameViewModel.game.currentIndexOfCard = 0
            self.gameViewModel.game.someCardTitle = self.gameViewModel.game.records[self.gameViewModel.game.currentIndexOfCard].word2
            self.setTitleForButtonCard(with: self.gameViewModel.game.someCardTitle)
        }
        alert.addAction(cancelButton)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkRecordsCountInHistory(){
        if gameViewModel.game.records.count == 0 {
            let alert = UIAlertController(title: nil, message: gameViewModel.dontHaveWords, preferredStyle: .alert)
            let okButton = UIAlertAction(title: gameViewModel.backToMainMenu, style: .default) { (al) in
                self.delegate?.toTranslationVCClicked()
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func setTitleForButtonCard(with title: String) {
        buttonCard.setTitle(title, for: .normal)
    }
    
    func visibilityOfPreviousButton(is: Bool) {
        buttonPrevious.isHidden = gameViewModel.isPreviousButtonHidden
    }
    
    
}
