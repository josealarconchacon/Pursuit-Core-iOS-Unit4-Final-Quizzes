//
//  QuizView.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizView: UIView {
    let quizCell = QuizCell()
    
    lazy var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 190, height: 330)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(hue: 0.2, saturation: 0.02, brightness: 0.9, alpha: 1.0)
        return collectionView
    }()
    
    lazy var noQuizLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 20
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        setUpQuizConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit() {
        self.myCollectionView.register(QuizCell.self, forCellWithReuseIdentifier: "QuizCell")
        setUpQuizConstraints()
    }
    private func setUpQuizConstraints(){
        addSubview(myCollectionView)
        addSubview(noQuizLabel)
        setCollectionViewConstraints()
    }
    func setCollectionViewConstraints() {
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        myCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1).isActive = true
        myCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1).isActive = true
        myCollectionView.heightAnchor.constraint(equalTo: heightAnchor, constant: 20).isActive = true
        
        noQuizLabel.translatesAutoresizingMaskIntoConstraints = false
        noQuizLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
        noQuizLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        noQuizLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60).isActive = true
        noQuizLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60).isActive = true
        noQuizLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        noQuizLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
