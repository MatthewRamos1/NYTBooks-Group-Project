//
//  BestSellerDetailViewController.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/13/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit
import DataPersistence

protocol DetailViewDelegate: AnyObject {
  func SaveButtonPressed(book: Books)
}

class BestSellerDetailViewController: UIViewController {
  
  private let bestSellerDetailView = BestSellerDetailView()
  
  public var book : Books!
  
  private var dataPersistence = DataPersistence<Books>(filename: "savedBooks.plist")
  
//  private bookmark = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(favoriteButtonPressed))
  
  override func loadView() {
    view = bestSellerDetailView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(favoriteButtonPressed))
    updateUI()
  }
  
  private func updateUI() {
    if dataPersistence.hasItemBeenSaved(book) {
      navigationItem.rightBarButtonItem?.image = UIImage(systemName: "bookmark.fill")
    }
    bestSellerDetailView.detailImageView.getImage(with: book.bookImage) { [weak self] (result) in
      DispatchQueue.main.async {
        switch result {
        case .failure:
          self?.bestSellerDetailView.detailImageView.image = UIImage(systemName: "book")
        case .success(let image):
          self?.bestSellerDetailView.detailImageView.image = image
        }
      }
    }
    bestSellerDetailView.titleLabel.text = book.title
    bestSellerDetailView.authorNameLabel.text = book.author
    bestSellerDetailView.textView.text = book.description
  }
  
  @objc private func favoriteButtonPressed() {
    navigationItem.rightBarButtonItem?.image = UIImage(systemName: "bookmark.fill")
    if dataPersistence.hasItemBeenSaved(book) {
      print("book already saved")
      showAlert(title: "Unable to save", message: "unable to save")
    } else {
    do {
      try dataPersistence.createItem(book)
      print("item saved")
    } catch {
      print("error")
    }
  }
  }
  
}
