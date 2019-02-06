//
//  ProfileCreationViewController.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
import AVFoundation
var loggedIn = false

class ProfileCreationViewController: UIViewController {
    var mainController: ProfileCreationViewController!
    
    var userName = String()
    var userImage = UIImage()
    var profileView = PorfileView()
    var selectedProfileimage = UIImage()
    private var imagePickerController: UIImagePickerController!
    let tapGesture = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hue: 0.1861, saturation: 0, brightness: 0.97, alpha: 1.0)
        navigationItem.title = "Profile"
        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        view.addSubview(profileView)
        tapGesture.addTarget(self, action: #selector(imageTapped))
        profileView.userImage.addGestureRecognizer(tapGesture)
        profileView.userImage.isUserInteractionEnabled = true
        if let userName = UserDefaults.standard.object(forKey: "name") as? String {
            if let imageData = UserDefaults.standard.object(forKey: userName) as? Data {
                if let image = UIImage(data: imageData) {
                    self.profileView.userImage.image = image
                }
            }
        }
        
        if let userName = UserDefaults.standard.object(forKey: "name") as? String {
            profileView.myLabel.text = userName
        } else if  loggedIn == false{
            profileAlert()
        }
    }
   
    override func viewDidAppear(_ animated: Bool) {
        if let userName = UserDefaults.standard.object(forKey: "name") as? String {
            profileView.myLabel.text = userName
        } else {
            profileAlert()
        }
        if let userName = UserDefaults.standard.object(forKey: "name") as? String {
            if let imageData = UserDefaults.standard.object(forKey: userName) as? Data {
                if let image = UIImage(data: imageData) {
                    self.profileView.userImage.image = image
                }
            }
        }
    }
    
    
    func profileAlert() {
        let alert = UIAlertController(title: "Enter username", message: "No spaces allowed or special characters", preferredStyle: .alert)
        alert.addTextField(configurationHandler: {(textField: UITextField) in
            textField.placeholder = "enter user name"
            textField.keyboardType = .default
            textField.textAlignment = .center
        })
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        let submit = UIAlertAction(title: "Submit", style: .default, handler: { (action) -> Void in
            DataPersistenceQuizzes.quizToSave(filename: UserDefaultKeys.defaultSearchKey)
            DataPersistenceQuizzes.quizToSave(filename: UserDefaultKeys.defaultKey)
            let textField = alert.textFields![0]
            if let text = alert.textFields?.first?.text{
                UserDefaults.standard.set(text, forKey: "name")
            }
            LogingHelper.loginState = .login
            if textField.text != "" {
                loggedIn = true
            }
            self.profileView.myLabel.text = textField.text!
            let alert = UIAlertController(title: nil, message: " Welcome \(textField.text!)", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in

            })
            alert.addAction(ok)
            self.present(alert,animated: true,completion: nil)
        })
        alert.addAction(cancel)
        alert.addAction(submit)
        present(alert, animated:  true, completion:  nil)
    }
    @objc func imageTapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { (action) -> Void in })
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in

        imagePickerController.sourceType = .photoLibrary
        }))
        actionSheet.addAction(cancel)
        print(actionSheet)
        self.present(imagePickerController, animated:  true, completion:  nil)
        print("tapped")
    }
}

extension ProfileCreationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
         profileView.userImage.image = image
        let imageToSave = image.jpegData(compressionQuality: 0.5)
            if let name = UserDefaults.standard.object(forKey: "name") as? String {
                     UserDefaults.standard.set(imageToSave, forKey: name)
                }
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

