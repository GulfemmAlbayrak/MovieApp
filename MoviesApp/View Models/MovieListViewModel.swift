//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Gulfem ALBAYRAK on 9.08.2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI

class MovieListViewModel: ViewModelBase {
   
    @Published var movies = [MovieViewModel]()
    let httpClient = HTTPClient()
    
    func fetchMovies(for category: MovieCategory) {
        let endpoint: String
        switch category {
        case .nowPlaying:
            endpoint = "now_playing"
        case .popular:
            endpoint = "popular"
        case .topRated:
            endpoint = "top_rated"
        case .upcoming:
            endpoint = "upcoming"
        }
        
        httpClient.getMoviesByCategory(endpoint) { result in
            switch result {
            case .success(let movies):
                if let movies {
                    DispatchQueue.main.async {
                        self.movies = movies.compactMap { movie in
                            guard
                                let id = movie.id,
                                let title = movie.title, !title.isEmpty,
                                let poster = movie.posterPath, !poster.isEmpty,
                                let releaseDate = movie.releaseDate, !releaseDate.isEmpty
                            else {
                                return nil
                            }
                            self.loadingState = .success
                            return  MovieViewModel(movie: movie)
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
    
    func searchByName(_ name: String) {
        
        self.loadingState = .loading
        
        httpClient.getMoviesBy(search: name) { result in
            switch result {
            case .success(let movies):
                if let movies {
                    DispatchQueue.main.async {
                        self.movies = movies.compactMap { movie in
                            // self.loadingState = .success
                            guard
                                let id = movie.id,
                                let title = movie.title, !title.isEmpty,
                                let poster = movie.posterPath, !poster.isEmpty,
                                let releaseDate = movie.releaseDate, !releaseDate.isEmpty
                            else {
                                return nil
                            }
                            return MovieViewModel(movie: movie)
                        }
                        self.loadingState = .success
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
}


struct MovieViewModel {
    
    let movie: Movie
    
    var id: Int {
        movie.id ?? 0
    }
    var title: String {
        movie.title ?? "aaa"
    }
    var poster: String {
        movie.posterPath ?? ""
    }
    var releaseDate: String {
        movie.releaseDate ?? ""
    }
}
