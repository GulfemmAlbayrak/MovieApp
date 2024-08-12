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
                            .font(.headline)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 3)
                            .background(self.selectedCategory == category ? Color.red : Color.clear)
                            .foregroundColor(self.selectedCategory == category ? .white : .gray)
                            .cornerRadius(10)
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
            
            .navigationBarTitle("Movies")
            
            
            if self.movieListVM.loadingState == .success {
                MovieListView(movies: self.movieListVM.movies)
            } else if self.movieListVM.loadingState == .failed {
                FailedView()
            } else if self.movieListVM.loadingState == .loading {
                LoadingView()
            }
            
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
