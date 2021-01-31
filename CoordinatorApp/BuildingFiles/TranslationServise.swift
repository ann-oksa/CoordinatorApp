//
//  Transformation.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 30.11.2020.
//

import Foundation

class TranslationService {
    
    let networkManager = GoogleTranslateAPIManager()
    
    func transformTranslationToLanguage(text: String, targetLanguage: Language, sourceLanguage: Language,  completionHandler: @escaping (String) -> Void )  {
        
        self.networkManager.translate(text: text, targetLanguage: targetLanguage, sourceLanguage: sourceLanguage) { translation in
            var result = String()
            switch translation {
            case .failure(.cantCreateURL) :
                print("class TranslationService -> func transformTranslationToLanguage -> switch translation -> case failure: can`t create URL from \(translation)")
            case .failure(.noData) :
                print("class TranslationService -> func transformTranslationToLanguage -> switch translation -> case failure: no data from \(translation)")
            case .success(let some ) :
                
                // This part of code may looks weird because we use special file GoogleTranslateAPIJSON
                //  It`s a hack to use a google api for free, more info you can find in this file and enum PurpleTranslation and TranslationTranslation
                switch some[0] {
                case .unionArrayArray(let array) :
                    switch array[0][0] {
                    case .string(let word):
                        result = word
                    default: break
                    }
                default:
                    print("class TranslationService -> func transformTranslationToLanguage -> switch translation -> switch case success-> case default: can`t extract translation from \(translation)")
                }
                
            default: print("class TranslationService -> func transformTranslationToLanguage -> switch translation -> case default: can`t extract translation from \(translation)")
            }
             let translation = TranslationOfWord(word: result, language: .empty)
                DispatchQueue.main.async {
                    completionHandler(translation.word)
                }
        }
    }
}
