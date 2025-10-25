//
//  MovieListViewModel.swift
//  BenedictMovies
//
//  Created by Reiss Zurbyk on 2025-10-23.
//

import Foundation

@MainActor
final class MovieListViewModel {
    private let apiClient: NetworkServicing // <-- use protocol

    var movies: [Movie] = []
    var errorMessage: String?
    var coordinator: AppCoordinatorProtocol?
    private let benedictId = 71580

    init(apiClient: NetworkServicing) { // <-- protocol instead of concrete type
        self.apiClient = apiClient
    }

    func load() async {
        do {
            let response: TMDBListResponse<Movie> = try await apiClient.fetch(
                TMDBListResponse<Movie>.self,
                from: .moviesByPerson(id: benedictId)
            )
            movies = response.results
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func didSelectRow(at index: Int) {
        guard index < movies.count else { return }
        let movie = movies[index]
        coordinator?.showMovieDetail(movie)
    }
}
