// ImagesDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Структура данных картинок
struct ImagesDTO: Codable {
    let thumbnail, small, regular, large: LargeDTO

    enum CodingKeys: String, CodingKey {
        case thumbnail = "THUMBNAIL"
        case small = "SMALL"
        case regular = "REGULAR"
        case large = "LARGE"
    }
}
