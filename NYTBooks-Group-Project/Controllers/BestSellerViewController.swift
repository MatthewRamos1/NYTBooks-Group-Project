//
//  ViewController.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/5/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit

class BestSellerViewController: UIViewController {
  
  private var bestSellerView = BestSellerView()
  
  public var myBooks = [Books]() {
    didSet {
      DispatchQueue.main.async {
        self.bestSellerView.collectionView.reloadData()
      }
    }
  }
  
  override func loadView() {
    view = bestSellerView
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      bestSellerView.collectionView.dataSource = self
      bestSellerView.collectionView.register(BookCell.self, forCellWithReuseIdentifier: "bookCell")
      loadBooks()
    }

  private func loadBooks() {
    NYTAPIClient.fetchBooks(for: "") { (result) in
      switch result {
      case .failure(let appError):
        print("Error: \(appError)")
      case .success(let books):
        self.myBooks = books
      }
    }
  }
  

}

extension BestSellerViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return myBooks.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath) as? BookCell else {
      fatalError("unable to downcast to BookCell")
    }
    let book = myBooks[indexPath.row]
    cell.configureCell(with: book)
    
    cell.backgroundColor = .white
    
    return cell
  }
  
}
