//
//  MovieDetailViewModel.swift
//  BenedictMovies
//
//  Created by Reiss Zurbyk on 2025-10-25.
//

import Foundation
import Combine

@MainActor
final class MovieDetailViewModel: ObservableObject {
    let movie: Movie
    let apiClient: NetworkServicing
    @Published var similarMovies: [Movie] = []
    @Published var errorMessage: String?

    init(movie: Movie, apiClient: NetworkServicing) {
        self.movie = movie
        self.apiClient = apiClient
    }

    var title: String {
        movie.title
    }

    var overview: String {
        movie.overview
    }

    var posterPath: String? {
        movie.posterPath
    }

    func fetchSimilarMovies() async {
        do {
            let response: TMDBListResponse<Movie> =
                try await apiClient.fetch(TMDBListResponse<Movie>.self,
                                          from: .similarMovies(movieID: movie.id))
            similarMovies = response.results
        } catch {
            errorMessage = "Failed to load similar movies."
            print("❌ Error fetching similar movies: \(error)")
        }
    }
}
