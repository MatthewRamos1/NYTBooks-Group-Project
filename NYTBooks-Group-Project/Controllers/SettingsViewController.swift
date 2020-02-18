//
//  SettingsViewController.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/7/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {
    
    let settingsView = SettingsView()
    
    public var userPreference: UserPreference!
    
    private var sectionName = "Advice How-To and Miscellaneous"
        
   
    override func loadView() {
          view = settingsView
      }
    
    
    public var categoryList = [String]() {
        didSet {
            DispatchQueue.main.async {
//                let index = self.getIndex()
                self.settingsView.pickerView.reloadAllComponents()
//                self.settingsView.pickerView.selectRow(index, inComponent: 0, animated: true)
                self.setPickerView()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
        loadBookTypes()
        
    }
    
    private func setPickerView() {
        if let savedIndex = userPreference.getIndex() {
            settingsView.pickerView.selectRow(savedIndex, inComponent: 0, animated: true)
        }
    }
    
    
    
    
    private func getIndex() {
        if let categoryName = userPreference.getSectionName() {
            if let index = categoryList.firstIndex(of: categoryName) {
                settingsView.pickerView.selectRow(index, inComponent: 0, animated: true)
                 print("the index is \(index)")
            }
        }
    }
    

    
    private func loadBookTypes() {
        NYTAPIClient.fetchBookTypes { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("Error: \(appError)")
            case .success(let list):
                self?.categoryList = list.map{$0.listName}.sorted()
            }
        }
    }
    
   
}


extension SettingsViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        categoryList.count
    }
    
}

extension SettingsViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedList = categoryList[row]
        let category = selectedList.replacingOccurrences(of: " ", with: "-").lowercased()
        userPreference.setSectionName(category)
        userPreference.setIndex(row)
    }
    
}
