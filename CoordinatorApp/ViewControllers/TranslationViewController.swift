//
//  ViewController.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 28.01.2021.
//

import UIKit

protocol TranslationViewControllerDelegate {
    func toHistoryVCClicked()
    func toGameVCClicked()
}

class TranslationViewController: UIViewController, UITextFieldDelegate, TranslationDelegate {
    
    @IBOutlet weak var chanchingLanguageController: UISegmentedControl!
    @IBOutlet weak var indicatorOfDownloading: UIActivityIndicatorView!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var wordInputField: UITextField!
    @IBOutlet weak var translateButton: UIButton!
    
    let translationViewModel : TranslationViewModel
    var delegate: TranslationViewControllerDelegate?
    
    init(viewModel: TranslationViewModel) {
        translationViewModel = viewModel
        super.init(nibName: "TranslationVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        translationViewModel.delegate = self
        self.wordInputField.delegate = self
        chanchingLanguageController.selectedSegmentIndex = translationViewModel.indexForSegmentController
        translationViewModel.changeLanguageDependingOnTheIndex(index: chanchingLanguageController.selectedSegmentIndex)
        isLoadingInProgress(loading: translationViewModel.isIndicatorOfDownloadingHidden)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardWithTappingOnScreen))
        view.addGestureRecognizer(gestureRecognizer)
        indicatorOfDownloading.isHidden = translationViewModel.isIndicatorOfDownloadingHidden
        wordInputField.returnKeyType = .go
        
    }
    
    @IBAction func getTranslation(_ sender: UIButton) {
        guard let inputText = wordInputField.text,
              inputText.isEmpty == false else {
            return
        }
        indicatorOfDownloading.isHidden = translationViewModel.isIndicatorOfDownloadingHidden
        translationViewModel.transformTranslationToLanguage(text: inputText, targetLanguage: translationViewModel.appState.targetLanguage, sourceLanguage: translationViewModel.appState.sourceLanguage)
       // indicatorOfDownloading.isHidden = translationViewModel.isIndicatorOfDownloadingHidden

    }
    
    @IBAction func toHistoryVC(_ sender: UIButton) {
        delegate?.toHistoryVCClicked()
    }
    
    @IBAction func toGameVC(_ sender: UIButton) {
        delegate?.toGameVCClicked()
    }
    
    @IBAction func changeLanguage(_ sender: UISegmentedControl) {
        translationViewModel.changeLanguageDependingOnTheIndex(index: chanchingLanguageController.selectedSegmentIndex)
    }
    
    @objc func hideKeyboardWithTappingOnScreen() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getTranslation(translateButton)
        wordInputField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        wordInputField.text = ""
    }
    
    func setValuesForOutlets(text: String) {
        self.translationLabel.text = text
    }
    
    func setValuesOfWordsDependingOnLanguages() {
        translationViewModel.setValuesOfWordsDependingOnLanguages(wordInputField.text ?? "", translationLabel.text ?? "")
    }
    
    func isLoadingInProgress(loading: Bool) {
        indicatorOfDownloading.isHidden = translationViewModel.isIndicatorOfDownloadingHidden
        indicatorOfDownloading.isHidden ? indicatorOfDownloading.stopAnimating() : indicatorOfDownloading.startAnimating()
    }
    
}

