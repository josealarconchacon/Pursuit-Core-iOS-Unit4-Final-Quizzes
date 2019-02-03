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
        button.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    @objc func buttonPress() {
        
    }
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
        addSubview(myButton)
        setConstraints()
    }
    func setConstraints() {
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        myButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
