//
//  ProfileCreationViewController.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
import AVFoundation


class ProfileCreationViewController: UIViewController, UITabBarControllerDelegate {
    var mainController: ProfileCreationViewController!
    @IBOutlet weak var profolioImageView: UIImageView!
    
    private var imagePickerViewController: UIImagePickerController!
    private var currentVC: UIViewController!
    
    var imageToSelect: UIImage!
    private var profolio = true
    
    private var profolioAlert = "" {
        didSet {
            setProfolioName()
        }
    }
    private func setProfolioName() {
        profolio = true
        for charecter in profolioAlert {
            if String(String(charecter)) == nil{
                profolio = false
                break
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Profile"
        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        mainController = ProfileCreationViewController()
        
    }

    @objc private func showActionSheet(viewController: UIViewController) {
        currentVC = viewController
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (alert:UIAlertAction!) -> Void in
          //  self.photoLibrary()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        viewController.present(actionSheet, animated: true, completion: nil)
    }
}

