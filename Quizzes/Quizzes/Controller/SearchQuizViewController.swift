//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchQuizViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       profileAlert()
    }
    func profileAlert() {
        let alert = UIAlertController(title: "Default Search", message: "Enter username&password", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { (action) -> Void in })
        let submit = UIAlertAction(title: "Submit", style: .destructive, handler: { (action) -> Void in })
        
        alert.addTextField(configurationHandler: {(textField: UITextField) in
            textField.placeholder = "Enter user name"
            textField.keyboardType = .default
        })
        alert.addAction(cancel)
        alert.addAction(submit)
        present(alert, animated:  true, completion:  nil)
    }
}
