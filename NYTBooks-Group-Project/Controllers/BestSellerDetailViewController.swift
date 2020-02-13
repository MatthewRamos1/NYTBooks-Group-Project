//
//  BestSellerDetailViewController.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/13/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit

class BestSellerDetailViewController: UIViewController {
    
    private let bestSellerDetailView = BestSellerDetailView()
  
    public var book : Books!

    
    override func loadView() {
        view = bestSellerDetailView
    }
  
  override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
    updateUI()
  }
  
  private func updateUI() {
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

}
