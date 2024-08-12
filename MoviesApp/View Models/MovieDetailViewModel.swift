//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Gulfem ALBAYRAK on 12.08.2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    private var movieDetail: MovieDetail?
    @Published var loadingState = LoadingState.loading
    
    private var httpClient = HTTPClient()
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
    }
    
    func getDetailsById(id: Int) {
        print("Fetching details for movie ID: \(id)")

        httpClient.getMovieDetailsBy(id: id) { result in
            switch result {
                case .success(let details):
                    DispatchQueue.main.async {
                        self.movieDetail = details
                        self.loadingState = .success
                    }
                
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
                   
            }
        }
        
    }
    
    var title: String {
        self.movieDetail?.title ?? ""
    }
    
    var releaseDate: String {
        self.movieDetail?.releaseDate ?? ""
    }
    
    var voteAverage: Double {
        self.movieDetail?.voteAverage ?? 0.0
    }
    
    var posterPath: String {
        self.movieDetail?.posterPath ?? ""
    }
    
    var overview: String {
        self.movieDetail?.overview ?? ""
    }
    
    var status: String {
        self.movieDetail?.status ?? ""
    }
    
    var tagline: String {
        self.movieDetail?.tagline ?? ""
    }
    var adult: Bool {
        self.movieDetail?.adult ?? false
    }
}
