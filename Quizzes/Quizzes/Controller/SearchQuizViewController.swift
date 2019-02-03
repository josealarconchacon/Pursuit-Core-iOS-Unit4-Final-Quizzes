//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchQuizViewController: UIViewController {
    let searchView = SearchQuizView()
    let searchCell = SearchCell()
    var addQuiz = [String]()
    
    var quizData = [QuizModel]() {
        didSet {
            self.searchView.myCollectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        navigationItem.title = "Search For Quizzes"
        view.addSubview(searchView)
        view.addSubview(searchCell)
        searchView.myCollectionView.delegate = self
        searchView.myCollectionView.dataSource = self
        dump(quizData)
        
    }
    @objc func addWasPressed(sender: UIButton) {
        if let userName = UserDefaults.standard.object(forKey: UserDefaultKeys.defaultSearchKey) as? String {
            let index = sender.tag
            let quizToSave = quizData[index]
            var ids = [String]()
            let quizzesSaved = DataPersistenceQuizzes.getQuiz(name: userName)
            for quiz in quizzesSaved {
                ids.append(quiz.id)
            }
            if ids.contains(quizToSave.id){
                let alert = UIAlertController(title: "Quiz already saved", message: "Please choose another one", preferredStyle: .alert)
                let okay = UIAlertAction(title: "Okay", style: .default) { (UIAlertAction) in
                    self.dismiss(animated: true, completion: nil)
                    
                }
                alert.addAction(okay)
                present(alert, animated: true, completion: nil)
            }
        }
    }
}
extension SearchQuizViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCell else {
            return UICollectionViewCell()}
        let addQuiz = quizData[indexPath.row]
        cell.label.text = addQuiz.quizTitle
        cell.myButton.tag = indexPath.row
        cell.myButton.addTarget(self, action: #selector(addWasPressed), for: .touchUpInside)
        return cell
    }
}

