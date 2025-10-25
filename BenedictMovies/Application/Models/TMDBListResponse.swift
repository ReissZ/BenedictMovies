//
//  TMDBListResponse.swift
//  BenedictMovies
//
//  Created by Reiss Zurbyk on 2025-10-24.
//

import Foundation

struct TMDBListResponse<T: Decodable>: Decodable {
    let page: Int
    let results: [T]
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
