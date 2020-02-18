//
//  FavoritesViewController.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/7/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit
import DataPersistence
import SafariServices

class FavoritesViewController: UIViewController {
    
    private var favView = FavoritesView()
    
    private var dataPersistence : DataPersistence<Favorite>
    
    public var favorites = [Favorite]() {
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
    
    init(_ dataPersistence: DataPersistence<Favorite>) {
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
        favView.collectionView.dataSource = self
        favView.collectionView.register(FavCell.self, forCellWithReuseIdentifier: "favCell")
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
    
    private func deleteBook(_ favorite: Favorite)  {
        guard let index = favorites.firstIndex(of: favorite) else { return }
        do {
            try dataPersistence.deleteItem(at: index)
            showAlert(title: "", message: "Item removed")
            loadSaved()
        } catch {
            loadSaved()
        }
    }
    
    
}

extension FavoritesViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favCell", for: indexPath) as? FavCell else {
            fatalError("Unable to downcast to BookCell")
        }
        
        let book = favorites[indexPath.row]
        cell.delegate = self
        cell.configureCell(book)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
    
}

extension FavoritesViewController : MoreButtonPressed {
    func moreButtonPressed(favorite: Favorite, favCell: FavCell) {
        guard let index = favorites.firstIndex(of: favorite) else { return }
        guard let endpointURL = URL(string: favorite.buyLink) else { return }
        let amazonSafari = SFSafariViewController(url: endpointURL)
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let delete = UIAlertAction(title: "Delete", style: .destructive) { (alertACtion) in
            self.deleteBook(favorite)
        }
        let amazon = UIAlertAction(title: "See on amazon", style: .default) { (alertAction) in
            self.present(amazonSafari, animated: true)
        }
        
        alert.addAction(amazon)
        alert.addAction(cancel)
        alert.addAction(delete)
        present(alert, animated: true)
    }
}


// MARK : Show Alert

extension UIViewController {
    func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: completion)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
