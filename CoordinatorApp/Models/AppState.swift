//
//  Singletone.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 09.12.2020.
//

import Foundation

class AppState {

    let history = History()
    let sorting = Sorting()
    var targetLanguage: Language = .russian
    var sourceLanguage: Language = .english
    
    func changeLanguageDependingOnTheIndex(index: Int) {
        if index == 0 {
            targetLanguage = .russian
            sourceLanguage = .english
        } else {
            targetLanguage = .english
            sourceLanguage = .russian
        }
    }
    
    func getRecords() -> [Record] {
        return history.journal
    }
    
    func createRecord(word1: String, word2: String) {
        history.createRecordInHistory(word1: word1, word2: word2)
    }
    
    
    
    
    
    
}
