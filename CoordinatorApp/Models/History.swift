//
//  History.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 07.12.2020.
//

import Foundation

class Record: Codable {
    var word1: String
    var word2: String
    let date: Date
    
    init(word1: String, word2: String) {
        self.word1 = word1
        self.word2 = word2
        self.date = Date()
    }
}


class History : Codable {
    
    var journal: [Record] = []
    
    init() {
        self.readHistoryFromDisk()
    }
    
    func createRecordInHistory(word1: String, word2: String) {
        let record = Record(word1: word1, word2: word2)
        addRecordToHistory(record: record)
        saveHistoryToDisk()
    }
    
    func addRecordToHistory(record: Record) {
        journal.append(record)
    }
    
    func removeRecordFromHistory(record: Record) {
        guard let indexOfRecord = journal.firstIndex(where: {$0 === record}) else { return  }
        journal.remove(at: indexOfRecord)
        self.saveHistoryToDisk()
    }
    
    func saveChangesInHistory(word1: String, word2: String, record: Record) {
        guard let indexOfRecord = journal.firstIndex(where: {$0 === record}) else { return  }
        journal[indexOfRecord].word1 = word1
        journal[indexOfRecord].word2 = word2
        self.saveHistoryToDisk()
    }
    
    func saveHistoryToDisk() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(journal)
            UserDefaults.standard.setValue(data, forKey: "journal")
        }
        catch {
            print("class History -> func saveHistoryToDisk -> error in encoding data: \(error.localizedDescription)")
        }
    }
    
    private func readHistoryFromDisk() {
        if let data = UserDefaults.standard.data(forKey: "journal") {
            let decoder = JSONDecoder()
            do {
                let records = try decoder.decode([Record].self, from: data)
                journal = records
            }
            catch {
                print("class History -> func saveHistoryToDisk -> error in decoding data: \(error.localizedDescription)")            }
        }
    }
}


