// LoadServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol LoadServiceProtocol {
    func loadImage(url: URL, imageId: String, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}
