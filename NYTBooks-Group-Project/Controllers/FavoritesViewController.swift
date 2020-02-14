//
//  FavoritesViewController.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/7/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit
import DataPersistence

class FavoritesViewController: UIViewController {
  
  private var favView = FavoritesView()
  
  private var dataPersistence : DataPersistence<Books>
  
  public var favorites = [Books]() {
    didSet {
      DispatchQueue.main.async {
        self.favView.collectionView.reloadData()
        if self.favorites.isEmpty {
          self.favView.collectionView.backgroundView = EmptyView(title: "No books favorited", message: "Please favorite a book on from the best sellers list to fill.")
      } else {
          self.favView.collectionView.backgroundView = nil
      }
    }
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
    view = favView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadSaved()
  }
  
  private func loadSaved() {
    do {
      favorites = try dataPersistence.loadItems()
      print("blank")
    } catch {
      print("error")
    }
  }
  
  
}
