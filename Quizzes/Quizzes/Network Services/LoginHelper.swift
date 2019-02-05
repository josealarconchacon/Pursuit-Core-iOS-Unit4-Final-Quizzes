//
//  LoginHelper.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/4/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

enum LoginState {
    case login
    case notLogged
}

struct LogingHelper {
    static var loginState: LoginState = .notLogged
}
