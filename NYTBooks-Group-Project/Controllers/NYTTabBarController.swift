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
  
  private var dataPersistence = DataPersistence<Books>(filename: "savedBooks.plist")
    
    private lazy var navController: BestSellerViewController = {
        let navController = BestSellerViewController(dataPersistence)
        navController.tabBarItem = UITabBarItem(title: "Best Sellers", image: UIImage(systemName: "star"), tag: 0)
      navController.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        return navController
    }()
    
    private lazy var favoritesViewController: FavoritesViewController = {
        let vc = FavoritesViewController(dataPersistence)
        vc.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 1)
      vc.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")
        return vc
    }()
    
    private lazy var settingsViewController: SettingsViewController = {
        let vc = SettingsViewController()
        vc.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        return vc
    }()
  

  

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [UINavigationController(rootViewController: navController), UINavigationController(rootViewController: favoritesViewController), UINavigationController(rootViewController: settingsViewController)]
    }
}
