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
    
    public var book: Books?
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
    }
    
    override func loadView() {
        view = bestSellerDetailView
    }
    
    func updateUI() {
        bestSellerDetailView.label.text = book?.author
        bestSellerDetailView.textView.text = book?.description
        bestSellerDetailView.detailImageView.image = detailImage
    }
    
}
