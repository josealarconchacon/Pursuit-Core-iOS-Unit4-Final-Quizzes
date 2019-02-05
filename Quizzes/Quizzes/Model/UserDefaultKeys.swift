//
//  UserDefaultKeys.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
import UIKit

struct UserDefaultKeys {
    static var defaultSearchKey = "name"
    static var defaultKey = "image"
    static func getUserImage() -> UIImage {
        var getImage = UIImage()
            if let name  = UserDefaults.standard.string(forKey: "name") as? String {
                if let image = UserDefaults.standard.string(forKey: UserDefaultKeys.defaultKey) as? Data {
                    let userImage = UIImage(data: image)
                        getImage = userImage!
                }
            }
            return getImage
        }
    }
