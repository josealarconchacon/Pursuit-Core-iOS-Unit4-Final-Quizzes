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
        textField.backgroundColor = UIColor(hue: 0.1861, saturation: 0, brightness: 0.97, alpha: 1.0)
        textField.placeholder = "enter text"
        textField.textAlignment = .center
        return textField
    }()
    lazy var mySecondTextView: UITextView = {
        let textViewTwo = UITextView()
        textViewTwo.backgroundColor = UIColor(hue: 0.2, saturation: 0.02, brightness: 0.9, alpha: 1.0)
        textViewTwo.text = "enter quiz fact"
        textViewTwo.textColor = UIColor.lightGray
        return textViewTwo
    }()
    lazy var myLastTextView: UITextView = {
        var lastTextView = UITextView()
        lastTextView.backgroundColor = UIColor(hue: 0.2, saturation: 0.02, brightness: 0.9, alpha: 1.0)
        lastTextView.text = "enter quiz fact"
        lastTextView.textColor = UIColor.lightGray
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
        addSubview(myLastTextView)
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
        
        myLastTextView.translatesAutoresizingMaskIntoConstraints = false
        myLastTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:210).isActive = true
        myLastTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        myLastTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        myLastTextView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myLastTextView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        myLastTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
