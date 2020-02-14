//
//  SettingsViewController.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/7/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit

import UIKit

class SettingsViewController: UIViewController {
    
    let settingsView = SettingsView()
    
    public var list = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.settingsView.pickerView.reloadAllComponents()
            }
        }
    }
    
    public var userPreference = UserPreference()
    
    

    override func loadView() {
          view = settingsView
      }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
        loadBookTypes()
        
        // ADDITION: scroll to picker view's index if there is a section saved in UserDefaults
//        if let selectedList = userPreference.getSectionName() {
//            if let index = list.firstIndex(of: selectedList) {
//            settingsView.pickerView.selectRow(index, inComponent: 0, animated: true)
//            } else {
//                print("sorry not saved")
//            }
//        }
    }
    
    

    
    private func loadBookTypes() {
        NYTAPIClient.fetchBookTypes { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("Error: \(appError)")
            case .success(let list):
                self?.list = list.map{$0.listName}
            }
        }
    }
    
   
}


extension SettingsViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        list.count
    }
    
}

extension SettingsViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedList = list[row]
        let category = list[row].replacingOccurrences(of: " ", with: "-").lowercased()
        userPreference.setSectionName(selectedList)
        print(userPreference.getSectionName())
        print(category)
    }
    
}
