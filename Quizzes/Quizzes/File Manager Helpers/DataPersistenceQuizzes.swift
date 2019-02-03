//
//  DataPersistenceQuizzes.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class DataPersistenceQuizzes {
    private static let name = "Quizzes.plist"
    private static var quiz = [QuizModel]()
    private static var quizToAdd = [AddQuiz]()
    private init() {}

    
static func quizToSave(name: String) {
    let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: name)
        do {
            let data = try PropertyListEncoder().encode(quiz)
            try data.write(to: path, options:  Data.WritingOptions.atomic)
        } catch {
            print("Property list encoding error: \(error)")
        }
    }
static func getQuiz(name: String) -> [QuizModel] {
    var quiz = [QuizModel]()
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: name).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    quiz = try PropertyListDecoder().decode([QuizModel].self, from: data)
                    //quizzes = quizzes.sorted{$0.date < $1.date}
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("data is nil")
        }
    } else {
        print("\(name) does not exist")
    }
    return quiz
}
static func delet(index: Int) {
    quizToAdd.remove(at: index)
    }
    static func save(name: String, getQuiz: AddQuiz) {
        quizToAdd.append(getQuiz)
    }
}


