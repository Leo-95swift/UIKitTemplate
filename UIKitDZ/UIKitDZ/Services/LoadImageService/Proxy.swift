// Proxy.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

var cacheData: Data?

/// Для загрузки картинки с fileManager если есть
final class Proxy: LoadServiceProtocol {
    private var service: LoadServiceProtocol
    private var fileManagerService = FileManagerService()

    init(service: LoadServiceProtocol) {
        self.service = service
    }

    func loadImage(url: URL, imageId imageID: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        if let image = fileManagerService.fetchImageFromDirectory(with: imageID) {
            completion(image.pngData(), nil, nil)
        } else {
            service.loadImage(url: url, imageId: imageID) { data, response, error in
                if let data = data {
                    self.fileManagerService.sendImageToDirectory(
                        imageURL: url,
                        imageName: imageID
                    )
                }
                completion(data, response, error)
            }
        }
    }
}
