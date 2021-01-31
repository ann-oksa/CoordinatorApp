//
//  CellForRecordViewModel.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 21.01.2021.
//

import Foundation

class CellForRecordViewModel {
    
    
    var leftWord = String()
    var rightWord = String()
    
    var rec : Record
    var englishLanguageOnLeftSide: Bool
    
    init(rec: Record,englishLanguageOnLeftSide: Bool) {
        self.rec = rec
        self.englishLanguageOnLeftSide = englishLanguageOnLeftSide
        configure(isEnglishLanguageOnLeftSide: englishLanguageOnLeftSide)
    }
    
  public func configure(isEnglishLanguageOnLeftSide: Bool) {
        if isEnglishLanguageOnLeftSide {
            leftWord = rec.word1
            rightWord = rec.word2
        } else {
            leftWord = rec.word2
            rightWord = rec.word1
        }
    }
    
    
    
}
