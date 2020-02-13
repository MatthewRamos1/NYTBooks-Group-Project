//
//  ListAPIClient.swift
//  NYTBooks-Group-Project
//
//  Created by Eric Davenport on 2/13/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import Foundation
import NetworkHelper

struct ListAPIClient {
  static func fetchList(completion: @escaping (Result<[BookTypes], AppError>) -> ()) {
    let endpointString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(Config.apiKey)"
    
    guard let url = URL(string: endpointString) else {
      completion(.failure(.badURL(endpointString)))
      return
    }
    
    let request = URLRequest(url: url)
    
    NetworkHelper.shared.performDataTask(with: request) { (results) in
      switch results {
      case .failure(let appError):
        completion(.failure(.networkClientError(appError)))
      case .success(let data):
        do {
        let results = try JSONDecoder().decode(List.self, from: data)
          let list = results.results
          completion(.success(list))
        } catch {
          completion(.failure(.decodingError(error)))
        }
        
      }
    }
  }
}
