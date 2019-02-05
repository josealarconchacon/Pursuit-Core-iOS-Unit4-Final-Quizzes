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
    
    var quizzes = [QuizModel]() {
        didSet {
//            DispatchQueue.main.async {
                self.detailQuiz.detailCView.reloadData()
//            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if (UserDefaults.standard.object(forKey: "Name") as? String) != nil {
            APIClient.quizzes { (appError, quizModel) in
                if let appError = appError {
                    print(appError.errorMessage())
                }
                if let quizModel = quizModel {
                    self.quizzes = quizModel
                    print(quizModel)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailQuiz)
        self.detailQuiz.detailCView.dataSource = self
        self.detailQuiz.detailCView.delegate = self
        detailQuiz.detailCView.reloadData()
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = detailQuiz.detailCView.cellForItem(at: indexPath) as? DetailQuizCollectionViewCell else {return }
            if cell.myLabel.text == titleInfo {
                UIView.transition(with: cell, duration: 1.0, options: .transitionFlipFromLeft, animations: {
                    cell.myLabel.text = self.facts[indexPath.row]
                })
            } else {
                UIView.transition(with: cell, duration: 1.0, options: .transitionFlipFromRight, animations: {
                    cell.myLabel.text = self.titleInfo
                })
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as? DetailQuizCollectionViewCell else {
            return UICollectionViewCell()}
            let setUpQuiz = facts[indexPath.row]
            cell.myLabel.text = self.titleInfo
            return cell
    }
}
