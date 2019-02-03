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
        layout.itemSize = CGSize.init(width: 200, height: 200)
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 20, right: 10)
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
//        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .gray
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
//        self.backgroundColor = .red
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
        setCollectionViewConstraints()
    }
    func setCollectionViewConstraints() {
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        myCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        myCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        myCollectionView.heightAnchor.constraint(equalTo: heightAnchor, constant: 50).isActive = true
    }
}
