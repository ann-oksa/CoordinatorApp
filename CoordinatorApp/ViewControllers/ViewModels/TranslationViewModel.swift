//
//  TranslationViewModel.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 18.01.2021.
//

import Foundation

protocol TranslationDelegate: class {
    func setValuesForOutlets(text: String)
    func setValuesOfWordsDependingOnLanguages()
    func isLoadingInProgress(loading: Bool)
}

class  TranslationViewModel {
    
    var transformation = TranslationService()
    var appState: AppState
    var isIndicatorOfDownloadingHidden = true {
        didSet {
            delegate?.isLoadingInProgress(loading: isIndicatorOfDownloadingHidden)
        }
    }
    
    init(appState: AppState) {
        self.appState = appState
    }
    // Assignment for this variable made for right saving words in func setValuesOfWordsDependingOnLanguages (english words in one group, russian words in enother group)
    var word1 = String()
    var word2 = String()
    
    weak var delegate: TranslationDelegate?
    
    func changeLanguageDependingOnTheIndex(index: Int) {
        appState.changeLanguageDependingOnTheIndex(index: index)
    }
    
    func transformTranslationToLanguage(text: String, targetLanguage: Language, sourceLanguage: Language) {
        transformation.transformTranslationToLanguage(text: text, targetLanguage: targetLanguage, sourceLanguage: sourceLanguage) { translatedText in
            self.delegate?.setValuesForOutlets(text: translatedText)
            self.delegate?.setValuesOfWordsDependingOnLanguages()
            self.isIndicatorOfDownloadingHidden = true
        }
    }
    
    func createRecord(word1: String, word2: String) {
        appState.createRecord(word1: word1, word2: word2)
    }
    
    func setValuesOfWordsDependingOnLanguages(_ firstWord: String, _ secondWord: String) {
        
        if appState.targetLanguage == .russian {
            word1 = firstWord
            word2  = secondWord
        } else {
            word1 = secondWord
            word2 = firstWord
        }
        createRecord(word1: word1, word2: word2)
        
    }
}
