//
//  SearchCell.swift
//  Quizzes
//
//  Created by Jose Alarcon Chacon on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    lazy var myButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add-icon-filled"), for: .normal)
        button.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    @objc func buttonPress() {
    }
    lazy var label: UILabel = {
        var label = UILabel()
        label.text = "Label"
        label.numberOfLines = 3
        label.textColor = .black
        label.font = UIFont(name: "Futura", size: 20)
        label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = .white
        commonInit()
        setUpCellConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func commonInit() {
        setUpCellConstraints()
    }
    func setUpCellConstraints() {
        addSubview(label)
        addSubview(myButton)
        setConstraints()
    }
    func setConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        myButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
