//
//  NYTAPIClient.swift
//  NYTBooks-Group-Project
//
//  Created by Matthew Ramos on 2/7/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import Foundation
import NetworkHelper

struct NYTAPIClient {
  static func fetchBooks(for type: String, completion: @escaping (Result<[Books], AppError>) -> ()) {
    
    let bookList = type.replacingOccurrences(of: " ", with: "-")
    
    let endpointString = "https://api.nytimes.com/svc/books/v3/lists/current/\(bookList).json?api-key=\(Config.apiKey)"
    guard let url = URL(string: endpointString) else {
      completion(.failure(.badURL(endpointString)))
      return
    }
    
    let request = URLRequest(url: url)
    
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure(let appError):
        completion(.failure(.networkClientError(appError)))
      case .success(let data):
        do {
          let query = try JSONDecoder().decode(TopBooks.self, from: data)
          let books = query.results.books
          completion(.success(books))
        } catch {
          completion(.failure(.decodingError(error)))
        }
      }
    }
  }
    
  static func fetchBookTypes(completion: @escaping (Result<[BookTypes], AppError>) -> ()) {
    
    let endpointString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(Config.apiKey)"
    guard let url = URL(string: endpointString) else {
      completion(.failure(.badURL(endpointString)))
      return
    }
    
    let request = URLRequest(url: url)
    
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure(let appError):
        completion(.failure(.networkClientError(appError)))
      case .success(let data):
        do {
          let query = try JSONDecoder().decode(List.self, from: data)
            let list = query.results
          completion(.success(list))
        } catch {
          completion(.failure(.decodingError(error)))
        }
      }
    }
  }
}

