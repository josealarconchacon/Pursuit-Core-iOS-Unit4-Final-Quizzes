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
    private static var quizzes = [QuizModel]()
    private static var quizToAdd = [AddQuiz]()
    private init() {}

    
static func quizToSave(filename: String) {
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(quizzes)
            try data.write(to: path, options:  Data.WritingOptions.atomic)
        } catch {
            print("Property list encoding error: \(error)")
        }
    }
    static func getQuiz(filename: String) -> [QuizModel] {
    var quiz = [QuizModel]()
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    quiz = try PropertyListDecoder().decode([QuizModel].self, from: data)
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
    static func delete(index: Int) {
        quizzes.remove(at: index)
    }
    static func save(newQuiztoSave: QuizModel, filename: String) {
        quizzes.append(newQuiztoSave)
        quizToSave(filename: filename)
    }
}


