//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by Gulfem ALBAYRAK on 9.08.2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var movieListVM: MovieListViewModel
    @State private var movieName: String = ""
    @State private var selectedCategory: MovieCategory = .nowPlaying
    
    init() {
        self.movieListVM = MovieListViewModel()
    }
    var body: some View {
        VStack {
            HStack{
                ForEach(MovieCategory.allCases, id: \.self) { category in
                    Button(action: {
                        self.selectedCategory = category
                        self.movieListVM.fetchMovies(for: category)
                    }) {
                        Text(category.rawValue)
                            .padding()
                            .background(self.selectedCategory == category ? Color.blue : Color.clear)
                            .foregroundColor(self.selectedCategory == category ? .white : .black)
                            .cornerRadius(5)
                                        
                    }
                    
                    
                }
            }
            .padding(.horizontal)
            
            TextField("Search", text: $movieName, onEditingChanged: { _ in }, onCommit: {
                // perform the search
                self.movieListVM.searchByName(self.movieName)
            })
            .padding(10)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            

            MovieListView(movies: self.movieListVM.movies)
            .navigationBarTitle("Movies")
        }
            .embedNavigationView()
            .onAppear {
                self.movieListVM.fetchMovies(for: self.selectedCategory)
            }
    }
}

#Preview {
    MovieListScreen()
}
