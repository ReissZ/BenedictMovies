//
//  Config.swift
//  BenedictMovies
//
//  Created by Reiss Zurbyk on 2025-10-25.
//

import Foundation

enum Secrets {
    static var tmdbAPIKey: String {
        guard
            let url = Bundle.main.url(forResource: "Secrets", withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            let dict = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any],
            let key = dict["TMDB_API_KEY"] as? String
        else {
            // Return empty to allow Demo Mode to kick in, or assert if you prefer hard failure.
            return ""
        }
        return key
    }
}
