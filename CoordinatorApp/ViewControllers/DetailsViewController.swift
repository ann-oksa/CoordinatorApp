//
//  DetailsTableViewController.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 31.01.2021.
//

import UIKit

protocol DetailsViewControllerDelegate: class {
    func toHistoryVCClicked()
}

class DetailsViewController: UIViewController, DetailsDelegate, UITextFieldDelegate {

    @IBOutlet weak var word1Textfield: UITextField!
    @IBOutlet weak var word2Textfield: UITextField!
    
    var detailsViewModel = DetailsViewModel(newChosenRecord: Record(word1: "", word2: ""))

    weak var delegate: DetailsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        word1Textfield.delegate = self
        word2Textfield.delegate = self
        detailsViewModel.delegate = self
        detailsViewModel.fillTextfieldsInFirstDownloading()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
   
    @IBAction func saveClicked(_ sender: UIButton) {
        detailsViewModel.saveChangesWithButtonClicked()
        print(detailsViewModel.wordOne)
        delegate?.toHistoryVCClicked()
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        detailsViewModel.wordOneAndTwoDidChanged(word1: word1Textfield.text, word2: word2Textfield.text)
    }
    func fillTextfieldsWithWords(word1: String, word2: String) {
        word1Textfield.text = word1
        word2Textfield.text = word2
    }
    
}
