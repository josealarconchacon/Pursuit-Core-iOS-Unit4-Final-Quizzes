//
//  CreatingViewController.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    let searchQuiz = QuizView()
    let quizCell = QuizCell()
    
    var addQuiz = [AddQuiz]() {
        didSet {
            DispatchQueue.main.async {
                self.searchQuiz.myCollectionView.reloadData()
                if self.addQuiz.count == 0 {
                    
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         title = "My Quizzes"
        view.backgroundColor = .white
        tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        searchQuiz.myCollectionView.dataSource = self
        searchQuiz.myCollectionView.delegate = self
        searchQuiz.myCollectionView.register(QuizCell.self, forCellWithReuseIdentifier: "QuizCell")
        view.addSubview(searchQuiz)
        view.addSubview(quizCell)
    }
    @objc func buttonPress(sender: UIButton) {
        let index = sender.tag
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
            DataPersistenceQuizzes.delet(index: index)
        }
    }
}

extension QuizViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addQuiz.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as? QuizCell else {
            return UICollectionViewCell()}
        let selectedQuiz = addQuiz[indexPath.row]
        cell.myButton.tag = indexPath.row
        cell.myButton.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        return cell
    }
}
