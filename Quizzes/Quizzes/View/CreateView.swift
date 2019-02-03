//
//  CreateView.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateView: UIView {

    lazy var myFirstTextField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = .lightGray
        textField.placeholder = "enter text"
        textField.textAlignment = .center
        return textField
    }()
    lazy var mySecondTextView: UITextView = {
        let textViewTwo = UITextView()
        textViewTwo.backgroundColor = .lightGray
        textViewTwo.text = "enter a text"
        textViewTwo.textAlignment = .center
        return textViewTwo
    }()
    lazy var myLastTexView: UITextView = {
        var lastTextView = UITextView()
        lastTextView.backgroundColor = .lightGray
        lastTextView.text = "enter a text"
        lastTextView.textAlignment = .center
        return lastTextView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        setUpConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit() {
        setUpConstraints()
    }
    private func setUpConstraints() {
        addSubview(myFirstTextField)
        addSubview(mySecondTextView)
        addSubview(myLastTexView)
        setCreateTextFieldConstraints()
    }
    func setCreateTextFieldConstraints() {
        myFirstTextField.translatesAutoresizingMaskIntoConstraints = false
        myFirstTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        myFirstTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        myFirstTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        myFirstTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myFirstTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        myFirstTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        mySecondTextView.translatesAutoresizingMaskIntoConstraints = false
        mySecondTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:60).isActive = true
        mySecondTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        mySecondTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        mySecondTextView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        mySecondTextView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        mySecondTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        myLastTexView.translatesAutoresizingMaskIntoConstraints = false
        myLastTexView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:210).isActive = true
        myLastTexView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        myLastTexView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        myLastTexView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myLastTexView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        myLastTexView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
