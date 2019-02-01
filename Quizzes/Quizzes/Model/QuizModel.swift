//
//  QuizModel.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
struct QuizModelData: Codable {
    let quiz: [QuizModel]
}
struct QuizModel: Codable {
    let id: String
    let quizTitle: String
    let facts: [String]
}
