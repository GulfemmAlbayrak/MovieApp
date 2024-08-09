//
//  Movie.swift
//  MoviesApp
//
//  Created by Gulfem ALBAYRAK on 9.08.2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Codable, Identifiable {
    let title: String?
    let releaseDate: String?
    let id: Int?
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case releaseDate = "release_date"
        case id
        case posterPath = "poster_path"
    }
}
