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
        textView.textAlignment = .center
        textView.isEditable = false
        return textView
    }()
    
    public lazy var amazonButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "amazonLogo"), for: .normal)
        button.tag = 0
        return button
    }()
    
    public lazy var iBooksLogo: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "ibooksLogo"), for: .normal)
        button.tag = 1
        return button
    }()
    
    public lazy var barnesAndNoblesButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "barnesNLogo"), for: .normal)
        button.tag = 2
        return button
    }()
    
    public lazy var localButton: UIButton = {
        let button = UIButton()
        button.tag = 3
        button.setBackgroundImage(UIImage(named: "local"), for: .normal)
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
        setupAmazonButton()
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
    private func setupAmazonButton() {
        addSubview(amazonButton)
        NSLayoutConstraint.activate([
            amazonButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            amazonButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            amazonButton.heightAnchor.constraint(equalToConstant: 50),
            amazonButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func setupButtons() {
        addSubview(amazonButton)
        addSubview(iBooksLogo)
        addSubview(barnesAndNoblesButton)
        addSubview(localButton)
        amazonButton.translatesAutoresizingMaskIntoConstraints = false
        iBooksLogo.translatesAutoresizingMaskIntoConstraints = false
        barnesAndNoblesButton.translatesAutoresizingMaskIntoConstraints = false
        localButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iBooksLogo.topAnchor.constraint(equalTo: amazonButton.bottomAnchor, constant: 8),
            iBooksLogo.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            iBooksLogo.heightAnchor.constraint(equalTo: amazonButton.heightAnchor),
            iBooksLogo.widthAnchor.constraint(equalTo: amazonButton.widthAnchor),
            barnesAndNoblesButton.topAnchor.constraint(equalTo: iBooksLogo.bottomAnchor, constant: 8),
            barnesAndNoblesButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            barnesAndNoblesButton.heightAnchor.constraint(equalTo: amazonButton.heightAnchor),
            barnesAndNoblesButton.widthAnchor.constraint(equalTo: amazonButton.widthAnchor),
            localButton.topAnchor.constraint(equalTo: barnesAndNoblesButton.bottomAnchor, constant: 8),
            localButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant:  -20),
            localButton.heightAnchor.constraint(equalTo: amazonButton.heightAnchor),
            localButton.widthAnchor.constraint(equalTo: amazonButton.widthAnchor)
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
            textView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            textView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            textView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 8)
        
        ])
    }

    
    

}
