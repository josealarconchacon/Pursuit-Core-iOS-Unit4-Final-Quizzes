//
//  QuizCell.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizCell: UICollectionViewCell {

    lazy var myButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icons8-button2"), for: .normal)
        button.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    @objc func buttonPress() {
    }
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 3
        label.textAlignment = .center
        label.text = "Hello"
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .white
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
        addSubview(myButton)
        addSubview(myLabel)
        setConstraints()
    }
    func setConstraints() {
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        myButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        myLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
}
