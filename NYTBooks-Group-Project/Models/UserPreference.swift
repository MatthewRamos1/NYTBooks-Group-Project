//
//  UserPreference.swift
//  NYTBooks-Group-Project
//
//  Created by David Lin on 2/14/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import Foundation

struct UserKey {
    static let selectedList = "Section Name"
}

protocol UserPreferenceDelegate: AnyObject {
  func didChangeBooksSection(_ userPreference: UserPreference, selectedList: String)
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
}
