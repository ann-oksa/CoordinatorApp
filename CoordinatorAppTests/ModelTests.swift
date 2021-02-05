//
//  CoordinatorAppTests.swift
//  CoordinatorAppTests
//
//  Created by Anna Oksanichenko on 28.01.2021.
//

import XCTest
@testable import CoordinatorApp

class ModelTests: XCTestCase {

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
    
    
    func testAddRecordsToHistory() throws {
        history.journal.append(one)
        let result = history.journal.count
        XCTAssertEqual(result, currentQuantityOfRecordsInHistory + 1, "wrong quantity of records in history")
    }
    
    func testRemoveRecordFromHistory() throws {
        history.journal.append(one)
        guard let indexOfRecord = history.journal.firstIndex(where: {$0 === one}) else { return  }
        history.journal.remove(at: indexOfRecord)
        let result = history.journal.count
        XCTAssertEqual(result, currentQuantityOfRecordsInHistory, "can`t remove record from history")
    }
    
    func testSaveChangesInHistory() throws {
        history.journal.append(one)
        guard let indexOfRecord = history.journal.firstIndex(where: {$0 === one}) else {  return }
        history.journal[indexOfRecord].word1 = "three"
        history.journal[indexOfRecord].word2 = "три"
        let result = history.journal[indexOfRecord].word1
        XCTAssertEqual(result, "three", "changed didn`t save in right way")
        
    }
    func testAppStateGetRecords() throws {
        let result = appState.getRecords().count
        XCTAssertEqual(result, currentQuantityOfRecordsInHistory, "cannot get right count of record in history")
    }
    
    func testAppStateChangeLanguageDependingOnTheIndex() throws {
        if index == 0 {
            targetLanguage = .russian
        } else {
            targetLanguage = .english
        }
        let result = targetLanguage.rawValue
        XCTAssertEqual(result, "ru", "target language isn`t right language depends on index")
    }
    
    func testGameSetCardTitle() throws {
        history.journal.append(one)
        guard let indexOfRecord = history.journal.firstIndex(where: {$0 === one}) else {  return }
        game.someCardTitle = history.journal[indexOfRecord].word1
        let result =  game.someCardTitle
        XCTAssertEqual(result, "one", "can`t set right card title")
    }
    

}
