//
//  DetailQuizViewController.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailQuizViewController: UIViewController {
    let detailQuiz = QuizDetailView()
    var facts = [String]()
    var titleInfo: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailQuiz)
        self.detailQuiz.detailCView.dataSource = self
        self.detailQuiz.detailCView.delegate = self
    }
    init(titleInfo: String ,facts: [String]) {
        super.init(nibName: nil, bundle: nil)
        self.titleInfo = titleInfo
        self.facts = facts
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension DetailQuizViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return facts.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as? DetailQuizCollectionViewCell else {
            return UICollectionViewCell()}
        let setUpQuiz = facts[indexPath.row]
        return cell
    }
}
