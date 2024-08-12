//
//  MovieDetail.swift
//  MoviesApp
//
//  Created by Gulfem ALBAYRAK on 12.08.2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//
import Foundation

struct MovieDetail: Decodable {
    let title: String
    let releaseDate: String?
    let voteAverage: Double
    let id: Int
    let posterPath: String?
    let overview: String?
    let status: String?
    let tagline: String?
    let adult: Bool

    enum CodingKeys: String, CodingKey {
        case title
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case id
        case posterPath = "poster_path"
        case overview
        case status
        case tagline
        case adult
    }
}
