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
  let book_image : String
  let buy_links : [BuyLinks]
}

struct BuyLinks : Codable & Equatable{
  let name : String
  let url : String
}

//
//{
//"status": "OK",
//"copyright": "Copyright (c) 2020 The New York Times Company.  All Rights Reserved.",
//"num_results": 10,
//"last_modified": "2020-02-06T12:38:02-05:00",
//"results": {
//    "list_name": "Business Books",
//    "list_name_encoded": "business-books",
//    "bestsellers_date": "2020-02-01",
//    "published_date": "2020-02-16",
//    "published_date_description": "latest",
//    "next_published_date": "",
//    "previous_published_date": "2020-01-01",
//    "display_name": "Business",
//    "normal_list_ends_at": 10,
//    "updated": "MONTHLY",
//    "books": [
//        {
//            --"rank": 1,
//            "rank_last_week": 0,
//            "weeks_on_list": 0,
//            "asterisk": 0,
//            "dagger": 0,
//            "primary_isbn10": "1250226848",
//            "primary_isbn13": "9781250226846",
//            --"publisher": "St. Martin's",
//            --"description": "",
//            "price": 0,
//            --"title": "LEADERSHIP STRATEGY AND TACTICS",
//            --"author": "Jocko Willink",
//            --"contributor": "by Jocko Willink",
//            "contributor_note": "",
//            --"book_image": "https://s1.nyt.com/du/books/images/9781250226846.jpg",
//            "book_image_width": 330,
//            "book_image_height": 418,
//            "amazon_product_url": "https://www.amazon.com/Leadership-Strategy-Tactics-Field-Manual/dp/1250226848?tag=NYTBS-20",
//            "age_group": "",
//            "book_review_link": "",
//            "first_chapter_link": "",
//            "sunday_review_link": "",
//            "article_chapter_link": "",
//            "isbns": [
//                {
//                    "isbn10": "1250226848",
//                    "isbn13": "9781250226846"
//                }
//            ],
//            "buy_links": [
//                {
//                    "name": "Amazon",
//                    "url": "https://www.amazon.com/Leadership-Strategy-Tactics-Field-Manual/dp/1250226848?tag=NYTBS-20"
//                },
//                {
//                    "name": "Apple Books",
//                    "url": "http://du-gae-books-dot-nyt-du-prd.appspot.com/buy?title=LEADERSHIP+STRATEGY+AND+TACTICS&author=Jocko+Willink"
//                },
//                {
//                    "name": "Barnes and Noble",
//                    "url": "http://www.anrdoezrs.net/click-7990613-11819508?url=http%3A%2F%2Fwww.barnesandnoble.com%2Fw%2F%3Fean%3D9781250226846"
//                },
//                {
//                    "name": "Local Booksellers",
//                    "url": "http://www.indiebound.org/book/9781250226846?aff=NYT"
//                }
//            ],
//            "book_uri": "nyt://book/b694a591-a6fa-55b0-914c-14f2e76f73fc"
//        }
