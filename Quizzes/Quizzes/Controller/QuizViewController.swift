//
//  CreatingViewController.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    var quizView = QuizView()
    let quizCell = QuizCell()
    
    var addQuiz = [QuizModel]() {
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
        
        if favoriteQuizzes.count == 0 {
            quizView.noQuizLabel.isHidden = false
            quizView.myCollectionView.isHidden = true
            quizView.noQuizLabel.text = "There are no quizzes. Please add one from the search tab, or create a new one."
        } else {
            quizView.noQuizLabel.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if favoriteQuizzes.count == 0 {
            quizView.noQuizLabel.isHidden = false
            quizView.myCollectionView.isHidden = true
            quizView.noQuizLabel.text = "There are no quizzes. Please add one from the search tab, or create a new one."
        } else {
            quizView.myCollectionView.isHidden = false
            quizView.noQuizLabel.isHidden = true
        }
            print("the favorite quizes are: ")
            print(favoriteQuizzes)
            print("there are \(favoriteQuizzes.count) favorite quizes")
            quizView.myCollectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let filename = UserDefaults.standard.object(forKey: UserDefaultKeys.defaultSearchKey) as? String {
            favoriteQuizzes = DataPersistenceQuizzes.getQuiz(filename: filename)
        }
    }
    @objc func buttonPress(sender: UIButton) {
            let index = sender.tag
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let delete = UIAlertAction(title: "Delete", style: .destructive) { (alert) -> Void  in
                DataPersistenceQuizzes.delete(index: index)
                    self.quizView.myCollectionView.reloadData()
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(delete)
            alert.addAction(cancel)
            self.present(alert, animated: true)
        }
    }

extension QuizViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return favoriteQuizzes.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize.init(width:200, height:300)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCell", for: indexPath) as? QuizCell else {
            return UICollectionViewCell()}
            let selectedQuiz = favoriteQuizzes[indexPath.row]
            cell.myLabel.text = selectedQuiz.quizTitle
            cell.quizButtonCell.tag = indexPath.row
            cell.quizButtonCell.addTarget(self, action: #selector(buttonPress(sender:)), for: .touchUpInside)
            return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let selectedQuiz = favoriteQuizzes[indexPath.row]
            let detailViewController = DetailQuizViewController.init(titleInfo: selectedQuiz.quizTitle , facts: selectedQuiz.facts)
            navigationController?.pushViewController(detailViewController, animated: true)
    }
}

