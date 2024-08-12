//
//  URL+Extensions.swift
//  MoviesApp
//
//  Created by Gulfem ALBAYRAK on 9.08.2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

extension URL {
    
    static func forMoviesByCategory(_ category: String) -> URL? {
        return URL(string: "https://api.themoviedb.org/3/movie/\(category)?api_key=\(Constants.apiKey)&language=en-US&page=1")
    }
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "https://api.themoviedb.org/3/search/movie?query=\(name)&api_key=\(Constants.apiKey)")
    }
    
    static func forMoviesById(_ id: Int) -> URL? {
        return URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=\(Constants.apiKey)")
    }
}
