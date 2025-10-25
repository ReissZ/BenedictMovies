//
//  SimilarMoviesView.swift
//  BenedictMovies
//
//  Created by Reiss Zurbyk on 2025-10-25.
//

import SwiftUI
import Kingfisher

struct SimilarMoviesView: View {
    let movies: [Movie]
    let apiClient: NetworkServicing
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(movies) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie, apiClient: apiClient)) {
                        VStack(alignment: .leading, spacing: 8) {
                            if let path = movie.posterPath,
                               let url = URL(string: "https://image.tmdb.org/t/p/w200\(path)") {
                                KFImage(url)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 180)
                                    .clipped()
                                    .cornerRadius(8)
                            } else {
                                Image(systemName: "film")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 180)
                                    .foregroundColor(.gray)
                            }
                            
                            Text(movie.title)
                                .font(.caption)
                                .lineLimit(2)
                                .frame(width: 120, alignment: .leading)
                        }
                    }
                }
            }
            .padding(.vertical)
        }
    }
}
