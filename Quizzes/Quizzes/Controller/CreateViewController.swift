//
//  CreateViewController.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
var newCreate = [AddQuiz]()

class CreateViewController: UIViewController {
    let createView = CreateView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(createView)
        createView.myFirstTextField.delegate = self
        createView.mySecondTextView.delegate = self
        createView.myLastTexView.delegate = self
        let leftButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancel))
        let rightButton = UIBarButtonItem(title: "Create", style: UIBarButtonItem.Style.plain, target: self, action: #selector(create))
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton
        alert()
    }
    @objc func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func create(_ sender: UIBarButtonItem) {
        if createView.myFirstTextField.text == nil {
            if createView.mySecondTextView.text == nil {
                if createView.myLastTexView.text == nil {
                }
            }
        }
        let factsDetail = [createView.myLastTexView, createView.mySecondTextView, createView.myLastTexView]
        let timeStamp = Date.getISOTimestamp()
        createView.myFirstTextField = createView.myFirstTextField
        createView.mySecondTextView = createView.mySecondTextView
        createView.myLastTexView = createView.myLastTexView
        UserDefaults.standard.object(forKey: UserDefaultKeys.defaultSearchKey) as? String;  do {
           let alert = UIAlertController(title: "Quiz Saved", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    func alert() {
        let alert = UIAlertController(title: "Logged In", message: "Please login to create quizzes", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
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

