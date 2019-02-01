//
//  QuizCell.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizCell: UICollectionViewCell {
    
    lazy var myImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        return image
    }()
    lazy var myButton: UIButton = {
        let button = UIButton()
//        button.backgroundColor = .blue
        button.setImage(UIImage(named: "icons8-button2"), for: .normal)
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
        addSubview(myImage)
        addSubview(myButton)
        setConstraints()
    }
    func setConstraints() {
        myImage.translatesAutoresizingMaskIntoConstraints = false
        myImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        myImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        myImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        myImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -210).isActive = true
        myImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.topAnchor.constraint(equalTo: topAnchor, constant: -10).isActive = true
        myButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
