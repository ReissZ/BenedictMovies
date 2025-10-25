//
//  APIClient.swift
//  BenedictMovies
//
//  Created by Reiss Zurbyk on 2025-10-23.
//

import Foundation

protocol NetworkServicing {
    func fetch<T: Decodable>(_ type: T.Type, from endpoint: Endpoint) async throws -> T
    func fetchMovies(from endpoint: Endpoint) async throws -> [Movie]
}

final class APIClient: NetworkServicing {
    init() {}

    nonisolated func fetch<T: Decodable>(_ type: T.Type, from endpoint: Endpoint) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: endpoint.url)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode)
        else { throw NetworkError.invalidResponse }

        do {
            return try await JSONDecoder.tmdb.decode(T.self, from: data)
        } catch {
            print("Decoding error: \(error)")
            throw NetworkError.decodingError(error)
        }
    }

    func fetchMovies(from endpoint: Endpoint) async throws -> [Movie] {
        let decoded: TMDBListResponse<Movie> = try await fetch(TMDBListResponse<Movie>.self, from: endpoint)
        return decoded.results
    }
}

