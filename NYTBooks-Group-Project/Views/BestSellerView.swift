//
//  BestSellerView.swift
//  NYTBooks-Group-Project
//
//  Created by Eric Davenport on 2/12/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit

class BestSellerView: UIView {
    
    public lazy var collectionView: UICollectionView = {
        let collectionViewBackgroundView = UIView()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame.size = frame.size
        gradientLayer.colors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor,#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
        gradientLayer.shouldRasterize = true
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 300)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundView = collectionViewBackgroundView
        cv.backgroundView?.layer.addSublayer(gradientLayer)
        return cv
    }()
    
    public lazy var pickerView : UIPickerView = {
        let pv = UIPickerView()
        pv.backgroundColor = .white
        return pv
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
        collectionViewSetup()
        pickerViewSetup()
    }
    
    private func collectionViewSetup() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 75),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func pickerViewSetup() {
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0),
            pickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            pickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            pickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
}
