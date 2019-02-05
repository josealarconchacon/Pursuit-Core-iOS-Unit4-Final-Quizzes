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
            DispatchQueue.main.async {
                self.searchView.myCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Search For Quizzes"
        view.addSubview(searchView)
        searchView.myCollectionView.delegate = self
        searchView.myCollectionView.dataSource = self
        
        APIClient.quizzes { (appError, quiz) in
            if let appError = appError {
                print(appError)
            }
            if let quiz = quiz {
                self.quizData = quiz
                print(self.quizData)
                print("the number of quizes is \(self.quizData.count)")
                self.quizData = self.quizData.sorted{$0.quizTitle < $1.quizTitle }
                DispatchQueue.main.async {
                    self.searchView.myCollectionView.reloadData()

                }
            }
        }
    }
    @objc func addToQuiz(sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: "The quiz is already in the list", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            
            let index = sender.tag
                let quizToSave = self.quizData[index]
                if let userName = UserDefaults.standard.object(forKey: "name") as? String{
                DataPersistenceQuizzes.save(newQuiztoSave: quizToSave, filename: userName)
                
            }
        }
        
        alertController.addAction(action)
        if favoriteQuizzes.contains(quizData[sender.tag]) != true {
            alertController.message = "The quiz was added to your favorite"
            favoriteQuizzes.append(quizData[sender.tag])
        }
        print(favoriteQuizzes)
        present(alertController,animated: true,completion: nil)
        tabBarController?.selectedIndex = 0
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
