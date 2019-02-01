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
        textField.backgroundColor = .gray
        textField.placeholder = "enter text"
        textField.textAlignment = .center
//        textField =  UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        return textField
    }()
    lazy var mySecondTextField: UITextField = {
        let textFieldTwo = UITextField()
        textFieldTwo.backgroundColor = .gray
        textFieldTwo.placeholder = "enter a text"
        textFieldTwo.textAlignment = .center
        return textFieldTwo
    }()
    lazy var myLastTextField: UITextField = {
        var lastTextField = UITextField()
        lastTextField.backgroundColor = .gray
        lastTextField.placeholder = "enter a text"
        lastTextField.textAlignment = .center
        return lastTextField
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
        addSubview(mySecondTextField)
        addSubview(myLastTextField)
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
        
        mySecondTextField.translatesAutoresizingMaskIntoConstraints = false
        mySecondTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:60).isActive = true
        mySecondTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        mySecondTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        mySecondTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        mySecondTextField.heightAnchor.constraint(equalToConstant: 140).isActive = true
        mySecondTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        myLastTextField.translatesAutoresizingMaskIntoConstraints = false
        myLastTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:210).isActive = true
        myLastTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        myLastTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        myLastTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myLastTextField.heightAnchor.constraint(equalToConstant: 140).isActive = true
        myLastTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
