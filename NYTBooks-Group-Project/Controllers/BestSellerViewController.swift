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
  
  public var list = [BookTypes]() {
    didSet {
      DispatchQueue.main.async {
        self.bestSellerView.pickerView.reloadAllComponents()
      }
    }
  }

  public var category = String() {
    didSet {
      loadBooks(with: category)
    }
  }
  override func loadView() {
    view = bestSellerView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    bestSellerView.pickerView.dataSource = self
    bestSellerView.pickerView.delegate = self
    loadCategories()
    bestSellerView.collectionView.dataSource = self
    bestSellerView.collectionView.delegate = self
    bestSellerView.collectionView.register(BookCell.self, forCellWithReuseIdentifier: "bookCell")
    loadBooks(with: "hardcover-advice")
    
  }
  
  private func loadCategories() {
    ListAPIClient.fetchList { (result) in
      switch result {
      case .failure(let appError):
        print("Error: \(appError)")
      case .success(let list):
        self.list = list
      }
    }
  }
  
  private func loadBooks(with category: String) {
    NYTAPIClient.fetchBooks(for: category) { (result) in
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

extension BestSellerViewController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let book = myBooks[indexPath.row]
    let detailVC = BestSellerDetailViewController()
    detailVC.book = book
    
    navigationController?.pushViewController(detailVC, animated: true)
  }
}

extension BestSellerViewController : UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return list.count
  }
}

extension BestSellerViewController : UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return list[row].displayName
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    category = list[row].listNameEncoded
    loadBooks(with: category)
  }
}
