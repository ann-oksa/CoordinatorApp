//
//  NetworkManager.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 24.11.2020.
//

import Foundation

struct GoogleTranslateAPIManager {
    
    enum GoogleTranslateAPIError: Error {
        case noData
        case cantCreateURL
        case unknownError(Error)
    }
    
    var createdUrl = CreatingURLManager()
    
    func translate(text: String, targetLanguage: Language, sourceLanguage: Language, completionHandler: @escaping (Result<Translation, GoogleTranslateAPIError>) -> Void ) {
        
        guard let url = createdUrl.createURLComponents(text: text, targetLanguage: targetLanguage, sourseLanguage: sourceLanguage) else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completionHandler(.failure(.noData))
                return
            }
            do {
                let responseModel = try JSONDecoder().decode(Translation.self, from: data)
                completionHandler(.success(responseModel))
                
            } catch {
                print("struct GoogleTranslateAPIManager -> func translate -> error in decoding: \(error)")
                completionHandler(.failure(.unknownError(error)))
            }
        }
        task.resume()
    }
}
