//
//  TabBarViewController.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var mainViewController = UINavigationController.init(rootViewController: ProfileCreationViewController())
    var searchViewController = UINavigationController.init(rootViewController: SearchQuizViewController())
    var quizViewController = UINavigationController.init(rootViewController: QuizViewController())
    var createViewController = UINavigationController.init(rootViewController: CreateViewController())
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([mainViewController, searchViewController, quizViewController, createViewController ], animated: true)
        mainViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile-unfilled"), tag: 0)
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "icons8-search"), tag: 0)
        quizViewController.tabBarItem = UITabBarItem(title: "Quiz", image: UIImage(named: "icons8-ask_question"), tag: 0)
        createViewController.tabBarItem = UITabBarItem(title: "Create", image: UIImage(named: "icons8-create_new"), tag: 0)
    }
}
