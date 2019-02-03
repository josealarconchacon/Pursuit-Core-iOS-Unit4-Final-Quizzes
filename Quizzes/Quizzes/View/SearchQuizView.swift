//
//  SearchQuizView.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchQuizView: UIView {
    let searchView = SearchCell()
    
    lazy var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 200, height: 250)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        setUpSearchConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func commonInit() {
        self.myCollectionView.register(SearchCell.self, forCellWithReuseIdentifier: "SearchCell")
        setUpSearchConstraints()
    }
    func setUpSearchConstraints() {
        addSubview(myCollectionView)
        setCollectionViewConstraints()
    }
    func setCollectionViewConstraints() {
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        myCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        myCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
