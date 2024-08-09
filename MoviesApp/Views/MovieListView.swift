//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Gulfem ALBAYRAK on 9.08.2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    
    let movies: [MovieViewModel]
    
    var body: some View {
        List(self.movies, id: \.id) { movie in
            MovieCell(movie: movie)
            }
        }
    }

#Preview {
    MovieListScreen()
}

struct MovieCell: View {
    
    let movie: MovieViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: "https://image.tmdb.org/t/p/w500\(movie.poster)")
                .frame(width: 100, height: 120)
                .cornerRadius(6)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.releaseDate)
                    .opacity(0.5)
                    .padding(.top, 10)
            }.padding(5)
            Spacer()
        }.contentShape(Rectangle())
    }
}
