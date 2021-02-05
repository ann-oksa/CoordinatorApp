//
//  HistoryViewModel.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 18.01.2021.
//

import Foundation


class  HistoryViewModel {
    
    var appState : AppState
    var chosenRecord: Record?
    var switchingStateOfLanguages = true
    var listOfCellViewModel = [CellForRecordViewModel]()
    
    init(records:  [Record], appState: AppState) {
        self.appState = appState
        //из этого массива делаем массив CellForRecordViewModel
        for record in records {
            let cellVM = CellForRecordViewModel(rec: record, englishLanguageOnLeftSide: switchingStateOfLanguages)
            self.listOfCellViewModel.append(cellVM)
        }
    }
    
    func switchStateOfLanguage() {
        switchingStateOfLanguages = !switchingStateOfLanguages
        for record in listOfCellViewModel {
            record.configure(isEnglishLanguageOnLeftSide: switchingStateOfLanguages)
        }
    }
    
    func removeChosenRecord(indexPath: IndexPath) {
        let indexOfRecordToRemove = indexPath.row
        let recordToRemove = listOfCellViewModel[indexOfRecordToRemove].rec
        appState.history.removeRecordFromHistory(record: recordToRemove)
        listOfCellViewModel.remove(at: indexOfRecordToRemove )
    }
    
    func selectRowToGo(indexPath: IndexPath) {
        chosenRecord = listOfCellViewModel[indexPath.row].rec
    }
    
    func sortDictionary(method: KindOfSorting) {
        switch method {
        case .fromAtoZ: listOfCellViewModel.sort(by: {$1.leftWord > $0.leftWord})
        case .fromZtoA: listOfCellViewModel.sort(by: {$1.leftWord < $0.leftWord})
        case .earliest: listOfCellViewModel.sort(by: {$1.rec.date > $0.rec.date})
        case .latest: listOfCellViewModel.sort(by: {$1.rec.date < $0.rec.date})
        }
    }
    
    func configureListOfModel() {
        for record in listOfCellViewModel {
            record.configure(isEnglishLanguageOnLeftSide: true)
            
        }
    }
}
