//
//  PorfileView.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class PorfileView: UIView {

    lazy var showView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    lazy var userImage: UIImageView = {
        var image = UIImageView(image: UIImage(named: "placeholder-image"))
//        image.backgroundColor = .black
        return image
    }()
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Text is in here"
        label.textAlignment = .center
        label.backgroundColor = .black
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        setUpUserImage()
        userImage.layer.cornerRadius = (self.frame.height * 0.2 * 0.8) / 3
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit() {
        setUpUserImage()
    }
    private func setUpUserImage() {
        addSubview(showView)
        addSubview(userImage)
        addSubview(myLabel)
        setUConstraints()
    }
    func setUConstraints() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        userImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        userImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.4).isActive = true
        userImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
        
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.heightAnchor.constraint(equalTo: showView.heightAnchor, multiplier: 0.6).isActive = true
        userImage.widthAnchor.constraint(equalTo: showView.heightAnchor, multiplier: 0.6).isActive = true
        userImage.centerYAnchor.constraint(equalTo: showView.centerYAnchor, constant: 5).isActive = true
        userImage.leadingAnchor.constraint(equalTo: showView.leadingAnchor, constant: 120).isActive = true
        
        showView.translatesAutoresizingMaskIntoConstraints = false
        showView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:50).isActive = true
        showView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        showView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        showView.heightAnchor.constraint(equalTo: heightAnchor, constant: -650).isActive = true
        
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
        myLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60).isActive = true
        myLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        myLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
