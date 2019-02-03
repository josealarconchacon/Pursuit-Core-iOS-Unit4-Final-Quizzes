//
//  APIClient.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct APIClient {
    private init () {}
    static func quizzes(completionHandler: @escaping(AppError?, [QuizModel]?) -> Void) {
        let urlString = "http://5c4d4c0d0de08100147c59b5.mockapi.io/api/v1/quizzes"
        NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let appError = appError {
                completionHandler(AppError.badURL("Bad url"), nil)
            }
            if let data = data {
                do {
                    let data = try JSONDecoder().decode([QuizModel].self, from: data)
                    completionHandler(nil, data)
                } catch {
                    completionHandler(appError, nil)
                }
            }
        }
    }
}
