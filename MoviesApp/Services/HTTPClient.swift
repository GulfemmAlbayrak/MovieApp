//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by Gulfem ALBAYRAK on 9.08.2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class HTTPClient {
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?,NetworkError>) -> Void ) {
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data , error == nil else {
                return completion(.failure(.noData))
            }
            guard let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            else {
                return completion(.failure(.decodingError))
            }
            completion(.success(moviesResponse.movies))
        }.resume()
    }
    
    func getMoviesByCategory(_ category: String, completion: @escaping (Result<[Movie]?, Error>) -> Void) {
        guard let url = URL.forMoviesByCategory(category) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(decodedResponse.movies))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }.resume()
    }
}
