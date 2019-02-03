//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
var favoriteQuizzes = [QuizModel]()

class SearchQuizViewController: UIViewController {
    var searchView = SearchQuizView()
    let searchCell = SearchCell()
    var allQuiz = [String]()
    
    var quizData = [QuizModel]() {
        didSet {
            self.searchView.myCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Search For Quizzes"
        view.addSubview(searchView)
        searchView.myCollectionView.delegate = self
        searchView.myCollectionView.dataSource = self
        //        dump(quizData)
        
        APIClient.quizzes { (appError, quiz) in
            if let appError = appError {
                print(appError)
            }
            if let quiz = quiz {
                self.quizData = quiz
                print(self.quizData)
                print("the number of quizes is \(self.quizData.count)")
                self.searchView.myCollectionView.reloadData()
            }
        }
    }
    @objc func addToQuiz(sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: "Was add it to the Quiz", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            if let name = UserDefaults.standard.object(forKey: UserDefaultKeys.defaultSearchKey) as? String {
            let index = sender.tag ; let quizToSave = self.quizData[index]
                let saveQuiz = DataPersistenceQuizzes.getQuiz(name: name)
            for item in saveQuiz {
                self.allQuiz.append(item.id)
                }
            }
        }
        alertController.addAction(action)
        favoriteQuizzes.append(quizData[sender.tag])
        print(favoriteQuizzes)
        present(alertController,animated: true,completion: nil)
    }
}

extension SearchQuizViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCell else {
            return UICollectionViewCell()}
        cell.layer.cornerRadius = 30
        cell.layer.masksToBounds = true
        let selectedQuiz = quizData[indexPath.row]
        cell.label.text = selectedQuiz.quizTitle
        cell.myButton.tag = indexPath.row
        cell.myButton.addTarget(self, action: #selector(addToQuiz(sender:)), for: .touchUpInside)
        return cell
    }
}
