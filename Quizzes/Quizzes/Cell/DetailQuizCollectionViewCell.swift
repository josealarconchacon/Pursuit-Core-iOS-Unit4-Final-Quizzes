//
//  DetailQuizCollectionViewCell.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailQuizCollectionViewCell: UICollectionViewCell {
    
    lazy var myLabel: UILabel = {
        var label = UILabel()
        label.text = "Hello"
        label.textColor = .black
        label.font = UIFont(name: "Futura", size: 25)
        label.numberOfLines = 10
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubview(myLabel)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        myLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
}

