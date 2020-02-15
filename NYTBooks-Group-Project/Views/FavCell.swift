//
//  FavCell.swift
//  NYTBooks-Group-Project
//
//  Created by Eric Davenport on 2/14/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit

protocol MoreButtonPressed : AnyObject {
  func moreButtonPressed(book: Books, favCell: FavCell)
}

class FavCell: UICollectionViewCell {
  
//  private var toggle = false
  
  
  weak var delegate : MoreButtonPressed?
  
  private var currentBook : Books!
  
  public lazy var gesture : UITapGestureRecognizer = {
    let gesture = UITapGestureRecognizer()
    gesture.numberOfTapsRequired = 2
    gesture.addTarget(self, action: #selector(screenTapped(_:)))
    return gesture
  }()
  
  public lazy var titleLabel : UILabel = {
    let label = UILabel()
    label.text = "Title Label"
    label.contentMode = .center
    label.backgroundColor = .magenta
    return label
  }()
  
  public lazy var imageView : UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "book.circle")
    imageView.backgroundColor = .systemTeal
    imageView.tintColor = .purple
    return imageView
  }()
  
  public lazy var descriptionLabel : UILabel = {
    let label = UILabel()
    label.text = "Description"
    label.backgroundColor = .orange
    return label
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }

  
  
  private func animate() {
    
  }
  
  private func commonInit() {
    titleLabelConstraint()
    imageConstraints()
    descriptionConstraints()
    addGestureRecognizer(gesture)
  }
  
  @objc private func buttonPressed(_ sender: UIButton) {
    delegate?.moreButtonPressed(book: currentBook, favCell: self)
  }
  
  @objc private func screenTapped(_ sender: UIGestureRecognizer) {
    delegate?.moreButtonPressed(book: currentBook, favCell: self)
  }
  
  
  public func configureCell(_ book: Books) {
    currentBook = book
    titleLabel.text = book.title
    descriptionLabel.text = book.description
    imageView.getImage(with: book.bookImage) { (result) in
      DispatchQueue.main.async {
        switch result {
        case .failure:
          self.imageView.image = UIImage(systemName: "bookmark.fill")
        case .success(let image):
          self.imageView.image = image
        }
      }
    }
  }
  
  private func titleLabelConstraint() {
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      titleLabel.heightAnchor.constraint(equalToConstant: 10)
    ])
  }
  
  private func imageConstraints() {
    addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
      imageView.heightAnchor.constraint(equalToConstant: 325)
    ])
  }
  
  private func descriptionConstraints() {
    addSubview(descriptionLabel)
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
      descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
      descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
      descriptionLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 25)
      
    ])
  }
  
}

