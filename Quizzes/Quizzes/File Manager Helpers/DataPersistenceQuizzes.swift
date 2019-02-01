//
//  DataPersistenceQuizzes.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class DataPersistenceQuizzes {
    private static let filename = "Quizzes.plist"
    private static var quiz = [QuizModelData]()
    private init() {}

    
    static func saveToDocumentsDirectory()-> [QuizModelData] {
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(quiz)
            try data.write(to: path, options:  Data.WritingOptions.atomic)
        } catch {
            print("Property list encoding error: \(error)")
        }
        return quiz
    }
    static func fetchQuizFromDocumentsDirectory() -> [QuizModelData] {
        var quiz = [QuizModelData]()
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    quiz = try PropertyListDecoder().decode([QuizModelData].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        return quiz
        }
    static func deletPost(index: Int) {
        
        }
    static func save() {
        
    }
}

