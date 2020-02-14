//
//  ViewController.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/5/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit
import DataPersistence

class BestSellerViewController: UIViewController {
  
  private var bestSellerView = BestSellerView()
  
  private var dataPersistence: DataPersistence<Books>

  
  public var myBooks = [Books]() {
    didSet {
      DispatchQueue.main.async {
        self.bestSellerView.collectionView.reloadData()
        if self.myBooks.isEmpty {
          self.bestSellerView.collectionView.backgroundView = EmptyView(title: "Empty", message: "unable to lod books")
        } else {
          self.bestSellerView.collectionView.backgroundView = nil
        }
      }
    }
  }
  
  public var list = [BookTypes]() {
    didSet {
      DispatchQueue.main.async {
        self.bestSellerView.pickerView.reloadAllComponents()
        self.bestSellerView.pickerView.selectRow((UserDefaults.standard.object(forKey: "pickerValue") as? Int ?? 1), inComponent: 0, animated: false)

      }
    }
  }
  
  private var savedBook = [Books]()
  
  private func loadString() {
    do {
     savedBook = try dataPersistence.loadItems()
    } catch {
      print("error")
    }
  }
  
  public var category = String() {
    didSet {
      loadBooks(with: category)
    }
  }
  
  
    
  init(_ dataPersistence: DataPersistence<Books>) {
    self.dataPersistence = dataPersistence
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
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
    loadBooks(with: "hardcover-nonfiction" )
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
//    UserDefaults.standard.set(list[row], forKey: "bookType")
    return list[row].displayName
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    category = list[row].listNameEncoded
    loadBooks(with: category)
    UserDefaults.standard.set(row, forKey: "pickerValue")
    
  }
  
  
}
