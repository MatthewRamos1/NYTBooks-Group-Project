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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

    }
    
    override func loadView() {
        view = bestSellerDetailView
    }

}
