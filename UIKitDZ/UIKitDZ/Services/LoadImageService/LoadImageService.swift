// LoadImageService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// ewmw
final class LoadImageService: LoadServiceProtocol {
    func loadImage(
        url: URL,
        imageId: String,

        completion: @escaping (Data?, URLResponse?, Error?) -> ()
    ) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil

        let session = URLSession(configuration: config)
        session.dataTask(with: url, completionHandler: completion).resume()
    }
}
