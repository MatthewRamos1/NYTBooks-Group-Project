//
//  BookTypes.swift
//  NYTBooks-Group-Project
//
//  Created by Eric Davenport on 2/13/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import Foundation

struct List : Codable & Equatable {
  let results : [BookTypes]
}

struct BookTypes : Codable & Equatable {
  let listName : String
  let displayName : String
  let listNameEncoded : String
  private enum CodingKeys: String, CodingKey {
    case listName = "list_name"
    case displayName = "display_name"
    case listNameEncoded = "list_name_encoded"
  }
}

