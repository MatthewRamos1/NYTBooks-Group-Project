//
//  SettingsViewController.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/7/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
  private let settingView = EmptyView(title: "SMoke", message: "SMoke")
  
  override func loadView() {
    view = settingView
  }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
}
