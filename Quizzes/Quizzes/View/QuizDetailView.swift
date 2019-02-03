//
//  QuizDetailView.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizDetailView: UIView {
    let detail = DetailQuizCollectionViewCell()
    
    var detailQuizView = DetailQuizCollectionViewCell()
    lazy var detailCView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 350, height: 500)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        var collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(){
        addSubview(detailCView)
        setupCollectionView()
        detailCView.register(DetailQuizCollectionViewCell.self, forCellWithReuseIdentifier: "DetailCell")
    }
    private func setupCollectionView(){
        detailCView.translatesAutoresizingMaskIntoConstraints = false
        detailCView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        detailCView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        detailCView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        detailCView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
}


