//
//  NetworkError.swift
//  BenedictMovies
//
//  Created by Reiss Zurbyk on 2025-10-23.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidResponse
    case invalidData
    case decodingError(Error)
    case custom(String)

    var errorDescription: String? {
        switch self {
        case .invalidResponse: return "The server response was invalid."
        case .invalidData: return "The data received from the server was invalid."
        case .decodingError(let error): return "Failed to decode response: \(error.localizedDescription)"
        case .custom(let message): return message
        }
    }
}
