//
//  MovieDetailView.swift
//  BenedictMovies
//
//  Created by Reiss Zurbyk on 2025-10-25.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    @StateObject private var viewModel: MovieDetailViewModel
    
    init(movie: Movie, apiClient: NetworkServicing) {
        _viewModel = StateObject(wrappedValue: MovieDetailViewModel(movie: movie, apiClient: apiClient))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Poster
                if let path = viewModel.posterPath,
                   let url = URL(string: "https://image.tmdb.org/t/p/w500\(path)") {
                    KFImage(url)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                } else {
                    Image(systemName: "film")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                }
                
                // Title
                Text(viewModel.title)
                    .font(.title)
                    .bold()
                
                // Overview
                Text(viewModel.overview)
                    .font(.body)
                
                // Similar Movies Section
                if !viewModel.similarMovies.isEmpty {
                    Text("Similar Movies")
                        .font(.headline)
                        .padding(.top)
                    
                    SimilarMoviesView(
                        movies: viewModel.similarMovies,
                        apiClient: viewModel.apiClient
                    )
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                } else {
                    ProgressView("Loading similar movies...")
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()
        }
        .navigationTitle(viewModel.title)
        .task {
            await viewModel.fetchSimilarMovies()
        }
    }
}
