//
//  app.swift
//  CoordinatorAppTests
//
//  Created by Anna Oksanichenko on 05.02.2021.
//

import XCTest
@testable import CoordinatorApp

class ViewModelsTests: XCTestCase {

    var one = Record(word1: "one", word2: "один")
    var two = Record(word1: "two", word2: "два")
    var three = Record(word1: "three", word2: "три")
    
    var history = History()
    var game = Game()
    var appState = AppState()
    let currentQuantityOfRecordsInHistory = 17
    var targetLanguage: Language = .russian
    var sourceLanguage: Language = .english
    var index = 0
    
    func testSetValueForNewGame() throws {
        var gameViewModel = GameViewModel(appState: appState)
        game.currentIndexOfCard = 0
        game.isCardOpen = true
        game.records = appState.history.journal
        game.someCardTitle = ""
        
        let result = game.isCardOpen
        XCTAssertEqual(result, true, "wrong")
    }
    
    func testGameNextClicked() throws {
        
        game.currentIndexOfCard += 1
        let result = history.journal[game.currentIndexOfCard].word1
        XCTAssertEqual(result, "apple", "wrong")
        
    }
    
 
    
    func testHistorySelectRowToGo() throws {
        var historyViewModel = HistoryViewModel(records: history.journal, appState: appState)
        let chosenIndexPath = 0
        historyViewModel.chosenRecord = historyViewModel.listOfCellViewModel[chosenIndexPath].rec
        let result = historyViewModel.chosenRecord?.word1
        XCTAssertEqual(result, "let", "wrong")
    }
    
    func testHistorySortDictionary() throws {
        var method : KindOfSorting = .fromZtoA
        var historyViewModel = HistoryViewModel(records: history.journal, appState: appState)

        historyViewModel.listOfCellViewModel.sort(by: {$1.leftWord < $0.leftWord})
        let result = historyViewModel.listOfCellViewModel.first?.leftWord
        XCTAssertEqual(result, "zoo", "wrong")
    }
    
    
    
//    func testGameActionForNewGame() throws {
//        var gameViewModel = GameViewModel(appState: appState)
//        game.currentIndexOfCard = 0
//       print( gameViewModel.game.records.count)
//       
//      //  game.someCardTitle = game.records[game.currentIndexOfCard].word2
//        let result = game.someCardTitle
//        XCTAssertEqual(result, "позволять", "wrong")
//    }
//    
    
    

}
