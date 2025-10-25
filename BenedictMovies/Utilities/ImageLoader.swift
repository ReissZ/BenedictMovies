//
//  ImageLoader.swift
//  BenedictMovies
//
//  Created by Reiss Zurbyk on 2025-10-23.
//

import Foundation
import Kingfisher
import UIKit

struct ImageLoader {
    static func loadImage(into imageView: UIImageView, from path: String?, size: String = "w500") {
        guard let path = path, let url = URL(string: "https://image.tmdb.org/t/p/\(size)\(path)") else {
            imageView.image = UIImage(systemName: "film")
            return
        }
        imageView.kf.setImage(with: url, placeholder: UIImage(systemName: "film"))
    }
}
