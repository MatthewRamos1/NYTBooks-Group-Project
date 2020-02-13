//
//  BestSellerData.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/7/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import Foundation

struct TopBooks : Codable & Equatable {
  let results : BookList
}

struct BookList : Codable & Equatable{
  let list_name: String
  let bestsellers_date: String
  let published_date: String
  let display_name: String
  let books: [Books]
}

struct Books : Codable & Equatable {
  let rank : Int
  let publisher : String
  let description : String
  let title : String
  let author : String
  let contributor : String
  let bookImage : String
  let buyLinks : [BuyLinks]
  private enum CodingKeys: String, CodingKey {
    case rank
    case publisher
    case description
    case title
    case author
    case contributor
    case bookImage = "book_image"
    case buyLinks = "buy_links"
  }
}

struct BuyLinks : Codable & Equatable{
  let name : String
  let url : String
}


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


