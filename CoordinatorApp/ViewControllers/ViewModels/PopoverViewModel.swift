//
//  PopoverViewModel.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 04.02.2021.
//

import Foundation

class PopoverViewModel {
    
    var appState: AppState
    var indexOfChosenRow = Int()
    var chosenRow = Int()
    var arrayOfSorting : [KindOfSorting] = []
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func saveIndexOfChosenRow(row: Int) {
        indexOfChosenRow = row
        UserDefaults.standard.setValue(indexOfChosenRow, forKey: "indexOfChosenRow")
    }
    
    func setIndexOfChosenRow() {
         chosenRow = UserDefaults.standard.integer(forKey: "indexOfChosenRow")
    }
}
