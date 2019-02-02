//
//  ProfileCreationViewController.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
import AVFoundation


class ProfileCreationViewController: UIViewController {
    var mainController: ProfileCreationViewController!
   
    var profileView = PorfileView()
    var selectedProfileimage: UIImage!
    private var imagePickerController: UIImagePickerController!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Profile"
        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        view.addSubview(profileView)
        profileAlert()
        y()
    }
    func profileAlert() {
        let alert = UIAlertController(title: "Default Search", message: "Enter username&password", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { (action) -> Void in })
        let submit = UIAlertAction(title: "Submit", style: .destructive, handler: { (action) -> Void in })

        alert.addTextField(configurationHandler: {(textField: UITextField) in
            textField.placeholder = "Enter user name"
            textField.keyboardType = .default
        })
        alert.addAction(cancel)
        alert.addAction(submit)
        present(alert, animated:  true, completion:  nil)
    }
    func y() {
        let image = UIImageView()
        
        var myActionSheet =  UIAlertController(title: "Delete all data ?", message: "You may not be able to recover this back", preferredStyle: UIAlertController.Style.actionSheet)
        myActionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        myActionSheet.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.default, handler: { (ACTION :UIAlertAction!)in
        }))
        myActionSheet.addAction(UIAlertAction(title: "Delete Permanently", style: UIAlertAction.Style.destructive, handler: { (ACTION :UIAlertAction!)in
        }))
        self.present(myActionSheet, animated: true, completion: nil)
        
    }
}

extension ProfileCreationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // code 
        }
    }
}
