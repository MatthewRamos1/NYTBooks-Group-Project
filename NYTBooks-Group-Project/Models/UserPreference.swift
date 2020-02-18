//
//  UserPreference.swift
//  NYTBooks-Group-Project
//
//  Created by David Lin on 2/14/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import Foundation

struct UserKey {
    static let selectedList = "News Section"
    static let selectedIndex = "Picked Index"
}

protocol UserPreferenceDelegate: AnyObject {
  func didChangeBooksSection(_ userPreference: UserPreference, selectedList: String)
    func didChangeIndex(_ userPreference: UserPreference, index: Int)
}

final class UserPreference {
  weak var delegate: UserPreferenceDelegate?
  
  public func getSectionName() -> String? {
    return UserDefaults.standard.object(forKey: UserKey.selectedList) as? String
  }
 
  public func setSectionName(_ selectedList: String) {
    UserDefaults.standard.set(selectedList, forKey: UserKey.selectedList)
    delegate?.didChangeBooksSection(self, selectedList: selectedList)
  }
    
    public func getIndex() -> Int? {
        return UserDefaults.standard.object(forKey: UserKey.selectedIndex) as? Int
    }
    
    public func setIndex(_ index: Int) {
        UserDefaults.standard.set(index, forKey: UserKey.selectedIndex)
        delegate?.didChangeIndex(self, index: index)
    }
    
}
