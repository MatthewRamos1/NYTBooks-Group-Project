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
  
  public var userPreference: UserPreference!
  
  public var myBooks = [Books]() {
    didSet {
      DispatchQueue.main.async {
        self.bestSellerView.collectionView.reloadData()
      }
    }
  }
  
  public var categoryList = [String]() {
    didSet {
      DispatchQueue.main.async {
        self.bestSellerView.pickerView.reloadAllComponents()
        self.setPickerView()
        self.setSection()
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
  
  override func viewWillLayoutSubviews() {
    self.navigationItem.title = "Best Sellers"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bestSellerView.pickerView.dataSource = self
    bestSellerView.pickerView.delegate = self
    loadBookTypes()
    bestSellerView.collectionView.dataSource = self
    bestSellerView.collectionView.delegate = self
    bestSellerView.collectionView.register(BookCell.self, forCellWithReuseIdentifier: "bookCell")
    loadBooks(with: category)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    self.setPickerView()
    self.setSection()
  }
  
  private func setPickerView() {
    if let savedIndex = userPreference.getIndex() {
      bestSellerView.pickerView.selectRow(savedIndex, inComponent: 0, animated: true)
    }
  }
  
  private func loadBookTypes() {
    NYTAPIClient.fetchBookTypes { [weak self] (result) in
      switch result {
      case .failure(let appError):
        print("Error: \(appError)")
      case .success(let list):
        self?.categoryList = list.map{$0.listName}.sorted()
      }
    }
  }
  
  private func getIndex() {
    if let categoryName = userPreference.getSectionName() {
      if let index = categoryList.firstIndex(of: categoryName) {
        bestSellerView.pickerView.selectRow(index, inComponent: 0, animated: true)
      }
    }
  }
  
  private func setSection() {
    if let section = userPreference.getSectionName() {
      loadBooks(with: section)
    } else {
      loadBooks(with: "advice-how-to-and-miscellaneous")
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
    guard let cell = collectionView.cellForItem(at: indexPath) as? BookCell else {
      fatalError("Couldn't downcast")
    }
    guard let detailImage = cell.savedImage else {
      fatalError("Couldn't get image")
    }
    let detailVC = BestSellerDetailViewController(detailImage)
    detailVC.book = book
    navigationController?.pushViewController(detailVC, animated: true)
  }
}
extension BestSellerViewController : UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return categoryList.count
  }
}
extension BestSellerViewController : UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return categoryList[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    category = categoryList[row]
    loadBooks(with: category)
  }
}

extension BestSellerViewController: UserPreferenceDelegate {
  func didChangeIndex(_ userPreference: UserPreference, index: Int) {
    getIndex()
  }
  
  func didChangeBooksSection(_ userPreference: UserPreference, selectedList: String) {
    loadBooks(with: selectedList)
  }
}
