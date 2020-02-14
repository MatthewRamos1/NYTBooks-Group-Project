//
//  BestSellerDetailViewController.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/13/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit
import AVFoundation
import DataPersistence
import SafariServices

class BestSellerDetailViewController: UIViewController {
    
    private let bestSellerDetailView = BestSellerDetailView()
    private let dataPeristence = DataPersistence<Favorite>(filename: "favorites.plist")
    
    public var book: Books!
    private var detailImage: UIImage
    
    init(_ detailImage: UIImage) {
        self.detailImage = detailImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        updateUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonWasPressed(_:)))
        bestSellerDetailView.amazonButton.addTarget(self, action: #selector(safariButtonPressed(_:)), for: .touchUpInside)
        bestSellerDetailView.googleButton.addTarget(self, action: #selector(safariButtonPressed(_:)), for: .touchUpInside)
        bestSellerDetailView.barnesAndNoblesButton.addTarget(self, action: #selector(safariButtonPressed(_:)), for: .touchUpInside)
        bestSellerDetailView.localButton.addTarget(self, action: #selector(safariButtonPressed(_:)), for: .touchUpInside)
    }
    
    override func loadView() {
        view = bestSellerDetailView
    }
    
    func updateUI() {
        bestSellerDetailView.label.text = book?.author
        bestSellerDetailView.textView.text = book?.description
        bestSellerDetailView.detailImageView.image = detailImage
    }
    
    func createFavoriteData(image: UIImage) -> Favorite? {
        let size = UIScreen.main.bounds.size
        let rect = AVMakeRect(aspectRatio: image.size, insideRect: CGRect(origin: CGPoint.zero, size: size))
        let resizeImage = image.resizeImage(to: rect.size.width / 2 , height: rect.size.height / 2)
        guard let resizedImageData = resizeImage.jpegData(compressionQuality: 1.0) else {
            return nil
        }
        let favorite = Favorite(rank: book.rank, description: book.description, title: book.title, author: book.author, imageData: resizedImageData, buyLink: book.amazonProductUrl)
        return favorite
    }
    
    func saveFavorite(favorite: Favorite) {
        do {
           try dataPeristence.createItem(favorite)
            showAlert(title: "Success", message: "Favorite has been saved to collection.")
        } catch {
            fatalError("Couldn't save favorite: \(error)")
        }
    }
    
    @objc
    func favoriteButtonWasPressed(_ sender: UIBarButtonItem) {
        guard let favoriteData = createFavoriteData(image: detailImage) else {
            fatalError("Couldn't save favorite")
        }
        saveFavorite(favorite: favoriteData)
    }
    
    @objc
    func safariButtonPressed(_ sender: UIButton) {
        var urlString = ""
        let links = book.buyLinks[sender.tag]
        urlString = links.url
        let url = NSURL(string: urlString)
        let svc = SFSafariViewController(url: url! as URL)
        present(svc, animated: true, completion: nil)
    }
    
}
