//
//  FavoritesData.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/14/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import Foundation

struct Favorites {
    let rank : Int
    let description : String
    let title : String
    let author : String
    let imageData : Data
    let buyLink: [String]
}
