//
//  Model.swift
//  CoordinatorApp
//
//  Created by Anna Oksanichenko on 28.01.2021.
//

import Foundation

class Model {
    var word: String
    var translation: String
    
    init(word: String, translation: String) {
        self.word = word
        self.translation = translation
    }
}

class Dictionary {
    var example : [Model] = [Model(word: "one", translation: "один"),
                             Model(word: "two", translation: "два"),
                             Model(word: "three", translation: "три"),
                             Model(word: "four", translation: "четыре")]
    
}
