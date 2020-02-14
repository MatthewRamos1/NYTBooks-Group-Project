//
//  BestSellerDetailView.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/13/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit

class BestSellerDetailView: UIView {
  
  public lazy var titleLabel : UILabel = {
    let label = UILabel()
    label.text = "Book Title"
    label.backgroundColor = .magenta
    label.textAlignment = .center
    return label
  }()
  
  public lazy var detailImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "amazonLogo")
    imageView.backgroundColor = .orange
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  public lazy var authorNameLabel: UILabel = {
    let label = UILabel()
    label.text = "Author Name"
    label.textAlignment = .center
    label.backgroundColor = .purple
    return label
  }()
  
  public lazy var textView: UITextView = {
    let textView = UITextView()
    textView.text = "Test"
    textView.backgroundColor = .cyan
    return textView
  }()
  
  public lazy var amazonButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "1.circle"), for: .normal)
    button.backgroundColor = .blue
    return button
  }()
  
  public lazy var appleBooksButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "1.circle"), for: .normal)
    button.backgroundColor = .blue
    return button
  }()
  
  public lazy var barnesNoblesButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "1.circle"), for: .normal)
    button.backgroundColor = .blue
    return button
  }()
  
  public lazy var localStoresButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "1.circle"), for: .normal)
    button.backgroundColor = .blue
    return button
  }()

  public lazy var tapGesture : UITapGestureRecognizer = {
    let gesture = UITapGestureRecognizer()
    gesture.numberOfTouchesRequired = 2
    gesture.addTarget(self, action: #selector(didTap))
    return gesture
  }()
  
  public lazy var bookmark : UIBarButtonItem = {
    let button = UIBarButtonItem()
    button.image = UIImage(systemName: "bookmark")
    
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
  
  @objc private func didTap(_ gesture: UITapGestureRecognizer) {
    
  }
//  @objc private func didLongPress(_ gesture: UILongPressGestureRecognizer) {
//    guard let currentArticle = currentArticle else { return }
//    if gesture.state == .began || gesture.state == .changed {
//      return
//    }
//
//    isSHowingImage.toggle()  // true -> false -> true
//    newImageView.getImage(with: currentArticle.getArticleImageURL(for: .normal)) { [weak self] (result) in
//      switch result {
//      case .failure:
//        break
//      case .success(let image):
//        DispatchQueue.main.async {
//          self?.newImageView.image = image
//          self?.animate()
//        }
//      }
//    }
//  }
//
//  private func animate() {
//    let duration : Double = 1.0 // seconds
//    if isSHowingImage {
//      UIView.transition(with: self, duration: duration, options: [.transitionFlipFromRight], animations: {
//        self.newImageView.alpha = 1.0
//        self.articleTitle.alpha = 0.0
//      }, completion: nil)
//    } else {
//      UIView.transition(with: self, duration: duration, options: [.transitionFlipFromLeft], animations: {
//        self.newImageView.alpha = 0.0
//        self.articleTitle.alpha = 1.0
//      }, completion: nil)
//    }
//  }
//
  
  private func commonInit() {
    titleLabelConstraints()
    amazonButtonConstraint()
    setupImageView()
    setupLabel()
    setupTextView()
    appleButtonConstraints()
    barnesNoblesConstraints()
    localStoresConstraints()
  }
  
  private func titleLabelConstraints() {
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
      titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
      titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20)
    ])
  }
  
  private func setupImageView() {
    addSubview(detailImageView)
    detailImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      detailImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      detailImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
      detailImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
      detailImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
      
    ])
  }
  
  private func amazonButtonConstraint() {
    addSubview(amazonButton)
    amazonButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      amazonButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
      amazonButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
      amazonButton.heightAnchor.constraint(equalToConstant: 50),
      amazonButton.widthAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  private func appleButtonConstraints() {
    addSubview(appleBooksButton)
    appleBooksButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      appleBooksButton.topAnchor.constraint(equalTo: amazonButton.bottomAnchor, constant: 20),
      appleBooksButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
      appleBooksButton.heightAnchor.constraint(equalToConstant: 50),
      appleBooksButton.widthAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  private func barnesNoblesConstraints() {
    addSubview(barnesNoblesButton)
    barnesNoblesButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      barnesNoblesButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
      barnesNoblesButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
      barnesNoblesButton.heightAnchor.constraint(equalToConstant: 50),
      barnesNoblesButton.widthAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  private func localStoresConstraints() {
    addSubview(localStoresButton)
    localStoresButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      localStoresButton.topAnchor.constraint(equalTo: barnesNoblesButton.bottomAnchor, constant: 20),
      localStoresButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
      localStoresButton.heightAnchor.constraint(equalToConstant: 50),
      localStoresButton.widthAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  private func setupLabel() {
    addSubview(authorNameLabel)
    authorNameLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      authorNameLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 8),
      authorNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
      authorNameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8)
    ])
  }
  
  private func setupTextView() {
    addSubview(textView)
    textView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      textView.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor, constant: 8),
      textView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
      textView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
      textView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 8)
      
    ])
  }
  
}
