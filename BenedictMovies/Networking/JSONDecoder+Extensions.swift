//
//  JSONDecoder+Extensions.swift
//  BenedictMovies
//
//  Created by Reiss Zurbyk on 2025-10-23.
//

import Foundation

extension JSONDecoder {
    static var tmdb: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
