//
//  MovieDetailScreen.swift
//  MoviesApp
//
//  Created by Gulfem ALBAYRAK on 12.08.2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieDetailScreen: View {
    let id: Int
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        VStack {
            if movieDetailVM.loadingState == .loading {
                LoadingView()
            } else if movieDetailVM.loadingState == .success {
                MovieDetailView(movieDetailVM: movieDetailVM)
            } else if movieDetailVM.loadingState == .failed {
                FailedView()
            }
        }
        .onAppear {
            print("MovieDetailScreen appeared with ID: \(self.id)")
            self.movieDetailVM.getDetailsById(id: self.id)
        }
    }
}

