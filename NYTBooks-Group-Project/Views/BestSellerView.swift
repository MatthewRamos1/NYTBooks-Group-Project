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
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 300, height: 400)
    let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    cv.backgroundColor = .systemRed
    return cv
  }()
  
  public lazy var pickerView : UIPickerView = {
    let pv = UIPickerView()
    pv.backgroundColor = .systemGroupedBackground
    pv.tintColor = .orange
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
