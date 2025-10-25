//
//  Endpoints.swift
//  BenedictMovies
//
//  Created by Reiss Zurbyk on 2025-10-23.
//

import Foundation

enum Endpoint {
    private static let baseURL = "https://api.themoviedb.org/3"
    private static let apiKey = Secrets.tmdbAPIKey
    
    case popularMovies
    case similarMovies(movieID: Int)
    case moviesByPerson(id: Int)

    var url: URL {
        switch self {
        case .popularMovies:
            return URL(string: "\(Endpoint.baseURL)/movie/popular?api_key=\(Endpoint.apiKey)&language=en-US&page=1")!
        case .similarMovies(let movieID):
            return URL(string: "\(Endpoint.baseURL)/movie/\(movieID)/similar?api_key=\(Endpoint.apiKey)&language=en-US&page=1")!
        case .moviesByPerson(let id):
            return URL(string: "\(Endpoint.baseURL)/discover/movie?api_key=\(Endpoint.apiKey)&with_cast=\(id)&language=en-US&page=1")!
        }
    }
}
