//
//  NYTTabBarController.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/7/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit
import DataPersistence

class NYTTabBarController: UITabBarController {
  
  private var dataPersistence = DataPersistence<Favorite>(filename: "favorites.plist")
    
    private lazy var navController: UINavigationController = {
        let navController = UINavigationController(rootViewController: BestSellerViewController())
        navController.tabBarItem = UITabBarItem(title: "Best Sellers", image: UIImage(systemName: "star.fill"), tag: 0)
        return navController
    }()
    
    private lazy var favoritesViewController: UIViewController = {
        let vc = FavoritesViewController(dataPersistence)
        vc.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart.fill"), tag: 1)
        return vc
    }()
    
    private lazy var settingsViewController: UIViewController = {
        let vc = SettingsViewController()
        vc.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        return vc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [navController, favoritesViewController, settingsViewController]
    }
}
