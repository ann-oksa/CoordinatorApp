//
//  DetailsViewModel.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 20.01.2021.
//

import Foundation

protocol DetailsDelegate: class {
    func fillTextfieldsWithWords(word1: String, word2: String)
}

class DetailsViewModel {
    
    let newChosenRecord : Record
    var shared = AppState.shared
    let constants = IdentifiersForSegue()
    var wordOne: String
    var wordTwo: String
    
    init(newChosenRecord: Record) {
        self.newChosenRecord = newChosenRecord
        self.wordOne = newChosenRecord.word1
        self.wordTwo = newChosenRecord.word2
    }
    
    weak var delegate: DetailsDelegate?
    
    func fillTextfieldsInFirstDownloading() {
        delegate?.fillTextfieldsWithWords(word1: newChosenRecord.word1, word2: newChosenRecord.word2)
    }
    
    func saveChangesWithButtonClicked() {
        shared.history.saveChangesInHistory(word1: wordOne, word2: wordTwo, record: newChosenRecord)
        print(wordOne)
        print(wordTwo)
    }
   
    public func wordOneAndTwoDidChanged(word1: String?, word2: String?) {
        wordOne = word1 ?? ""
        wordTwo = word2 ?? ""
    }
}
