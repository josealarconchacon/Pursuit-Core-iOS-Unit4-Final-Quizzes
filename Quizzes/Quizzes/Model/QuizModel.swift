//
//  QuizModel.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation


struct QuizModel: Codable {
    let id: String
    let quizTitle: String
    let facts: [String]
}
struct AddQuiz: Codable {
    let id: String
    let quizTitle: String
    let facts: [String]
    let createdAt: String
    
    public var date: Date {
        let date = createdAt.date()
        return date
    }
}
