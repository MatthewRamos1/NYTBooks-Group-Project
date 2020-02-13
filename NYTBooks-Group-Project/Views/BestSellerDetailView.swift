//
//  BestSellerDetailView.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/13/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit

class BestSellerDetailView: UIView {

    public lazy var detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "amazonLogo")
        return imageView
    }()
    
    public lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Author Name"
        label.textAlignment = .center
        return label
    }()
    
    public lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = "Test"
        return textView
    }()
    
    public lazy var amazonButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "amazonLogo"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupButtons()
        setupImageView()
        setupLabel()
        setupTextView()
    }
    
    private func setupImageView() {
        addSubview(detailImageView)
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            detailImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            detailImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
        
        ])
    }
    
    private func setupButtons() {
        addSubview(amazonButton)
        amazonButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            amazonButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            amazonButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            amazonButton.heightAnchor.constraint(equalToConstant: 50),
            amazonButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            label.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
    private func setupTextView() {
        addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            textView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 8),
            textView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            textView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 8)
        
        ])
    }

    
    

}
