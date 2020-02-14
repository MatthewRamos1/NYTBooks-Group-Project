//
//  BookCell.swift
//  NYTBooks-Group-Project
//
//  Created by Eric Davenport on 2/12/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit
import ImageKit

protocol ButtonPressedDelegate : AnyObject {
  func ButtonPressed(book: Books)
}

class BookCell: UICollectionViewCell {
  
  public lazy var titleLabel : UILabel = {
    let label = UILabel()
    label.text = "Title"
    label.textAlignment = .center
    return label
  }()
  
  public lazy var imageView : UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .purple
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  public lazy var descriptionLabel : UILabel = {
    let label = UILabel()
    label.text = "Description"
    label.numberOfLines = 0
    return label
  }()
  
  public lazy var rankLabel : UILabel = {
    let label = UILabel()
    label.text = "RANK"
    label.font = label.font.withSize(10)
    label.textAlignment = .left
    return label
  }()
  
  public lazy var rankImageView : UIImageView = {
    let imageView = UIImageView()
    imageView.tintColor = .black
    return imageView
  }()
    
    public var savedImage: UIImage!
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    titleLabelConstraints()
    imageViewConstraintSetup()
    descriptionLabelSetup()
    rankLabelConstraints()
    rankImageViewConstraints()
  }
  
  func configureCell(with book: Books) {
    titleLabel.text = book.title
    descriptionLabel.text = book.description
    imageView.getImage(with: book.bookImage) { [weak self] (result) in
      DispatchQueue.main.async {
        switch result {
        case .failure:
          self?.imageView.image = UIImage(systemName: "book")
          self?.rankImageView.image = UIImage(systemName: "\(book.rank).circle")
        case .success(let image):
          self?.imageView.image = image
          self?.savedImage = image
          self?.rankImageView.image = UIImage(systemName: "\(book.rank).circle")
        }
      }
    }
  }
  
  private func titleLabelConstraints() {
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
    ])
  }
  
  private func rankLabelConstraints() {
    addSubview(rankLabel)
    rankLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
    rankLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
    rankLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
    ])
  }
  
  private func rankImageViewConstraints() {
    addSubview(rankImageView)
    rankImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      rankImageView.topAnchor.constraint(equalTo: rankLabel.bottomAnchor),
      rankImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      rankImageView.heightAnchor.constraint(equalToConstant: 30),
      rankImageView.widthAnchor.constraint(equalToConstant: 30)
    ])
  }
  
  private func imageViewConstraintSetup() {
    addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
      imageView.heightAnchor.constraint(equalToConstant: 200)
    ])
  }

  private func descriptionLabelSetup() {
    addSubview(descriptionLabel)
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
      descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
      descriptionLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
      descriptionLabel.heightAnchor.constraint(equalToConstant: 150)
    ])
  }
  
}
