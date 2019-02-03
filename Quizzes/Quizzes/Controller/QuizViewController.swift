//
//  CreatingViewController.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    let quizView = QuizView()
    let quizCell = QuizCell()
    
    var addQuiz = [AddQuiz]() {
        didSet {
            DispatchQueue.main.async {
                self.quizView.myCollectionView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         title = "My Quizzes"
        view.backgroundColor = .white
        view.addSubview(quizView)
        tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        quizView.myCollectionView.dataSource = self
        quizView.myCollectionView.delegate = self
        quizView.myCollectionView.register(QuizCell.self, forCellWithReuseIdentifier: "QuizCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("the favorite quizes are: ")
        print(favoriteQuizzes)
        print("there are \(favoriteQuizzes.count) favorite quizes")
        quizView.myCollectionView.reloadData()
    }
    
    @objc func buttonPress(sender: UIButton) {
        if let name = UserDefaults.standard.object(forKey: UserDefaultKeys.defaultSearchKey) as? String {
            let index = sender.tag
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let delete = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
                DataPersistenceQuizzes.delet(index: index)
                _ = DataPersistenceQuizzes.getQuiz(name: name)
            }
             let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(delete)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
    }
}

extension QuizViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteQuizzes.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width:200, height:300)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedQuiz = favoriteQuizzes[indexPath.row]
        let detailViewController = DetailQuizViewController.init(titleInfo: selectedQuiz.quizTitle , facts: selectedQuiz.facts)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as? QuizCell else {
            return UICollectionViewCell()}
        let selectedQuiz = favoriteQuizzes[indexPath.row]
        cell.myLabel.text = selectedQuiz.quizTitle
        cell.quizButtonCell.tag = indexPath.row
        cell.quizButtonCell.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        return cell
    }
}

