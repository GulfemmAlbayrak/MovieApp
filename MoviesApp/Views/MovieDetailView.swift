//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Gulfem ALBAYRAK on 12.08.2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieDetailVM: MovieDetailViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                ZStack(alignment: .topTrailing) {
                    URLImage(url: "https://image.tmdb.org/t/p/w500\(movieDetailVM.posterPath)")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: .infinity)
                        .cornerRadius(12)
                    
                    Text(movieDetailVM.status)
                        .font(.caption)
                        .padding(8)
                        .background(Color.gray.opacity(0.3))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding([.top, .trailing], 10)
                    if movieDetailVM.adult {
                        Image("adult")
                            .resizable()
                            .frame(width: 40, height: 40) // Adjust the size as needed
                            .padding(12)
                            .padding([.top, .leading], 30)
                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text(movieDetailVM.tagline)
                        .font(.title)
                        .bold()
                        .padding(.bottom, 4)
                    Text(movieDetailVM.overview)
                        .font(.body)
                    
                    HStack {
                        Rating(rating: .constant(Int(movieDetailVM.voteAverage)))
                        Text("\(Int(movieDetailVM.voteAverage))/10")
                            .font(.caption)
                            .bold()
                            .padding(.leading, 2)
                    }
                    .padding(.top, 12)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(UIColor.systemGray6))
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                )
                
                Spacer()
            }
            
        }.padding()
        .navigationBarTitle(self.movieDetailVM.title)
    }
}


#Preview {
    let movieDetail = MovieDetail(title: "Batman", releaseDate: "1989-06-21", voteAverage: 7.228, id: 174, posterPath: "/cij4dd21v2Rk2YtUQbV5kW69WB2.jpg", overview: "Batman must face his most ruthless nemesis when a deformed madman calling himself \"The Joker\" seizes control of Gotham's criminal underworld.", status: "Released", tagline: "Justice is always darkest before the dawn.", adult: true)

    return MovieDetailView(movieDetailVM: MovieDetailViewModel(movieDetail: movieDetail))
        .embedNavigationView()
}
