//
//  CreateViewController.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
var newCreate = [AddQuiz]()
var loggInUser = false

class CreateViewController: UIViewController {
    let createView = CreateView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(createView)
        createView.myFirstTextField.delegate = self
        createView.mySecondTextView.delegate = self
        createView.myLastTextView.delegate = self
        let leftButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancel))
        let rightButton = UIBarButtonItem(title: "Create", style: UIBarButtonItem.Style.plain, target: self, action: #selector(create))
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton
    }
    override func viewDidAppear(_ animated: Bool) {
        if loggedIn == false {
            createQuizLoginAlert()
        }
    }
    func createQuizLoginAlert() {
        let alert = UIAlertController(title: nil, message: "You need to Logged In", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
        alert.addAction(ok)
        self.present(alert,animated: true,completion: nil)
    }
   
    @objc func cancel(_ sender: UIBarButtonItem) {
        tabBarController?.selectedIndex = 0
        print("cancel button \(cancel)")
    }
    @objc func create(_ sender: UIBarButtonItem) {
        if (createView.myFirstTextField.text == nil) || (createView.mySecondTextView.text == nil) || (createView.myLastTextView.text == nil) {
            print("Please include a Quiz name and two facts")
            return
        }
//        let factsDetail = [createView.myLastTextView, createView.mySecondTextView, createView.myLastTextView]
//        let timeStamp = Date.getISOTimestamp()
        
        let newQuizName = createView.myFirstTextField.text
        let newQuizFactOne = createView.mySecondTextView.text
        let newQuizFactTwo = createView.myLastTextView.text
        
        let newQuiz = QuizModel.init(id: "some ID", quizTitle: newQuizName!, facts: [newQuizFactOne!, newQuizFactTwo!])
        
        favoriteQuizzes.append(newQuiz)
//        createView.myFirstTextField = createView.myFirstTextField.text
//        createView.mySecondTextView = createView.mySecondTextView
//        createView.myLastTextView = createView.myLastTextView
        UserDefaults.standard.object(forKey: UserDefaultKeys.defaultSearchKey) as? String;  do {
           let alert = UIAlertController(title: "Quiz Saved", message: nil, preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
}
extension CreateViewController: UITextViewDelegate, UITextFieldDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == nil {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

