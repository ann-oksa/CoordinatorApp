//
//  Game.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 23.12.2020.
//

import Foundation


class Game {
    
    var records : [Record] = []
    var isCardOpen : Bool = false
    var someCardTitle: String = ""
    var currentIndexOfCard : Int = 0
    
    func setCardTitle(record: [Record]) -> String {
        someCardTitle = record[currentIndexOfCard].word1
        return someCardTitle
    }
    
    
}
