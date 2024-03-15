// URLSession+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

extension URLSession {
    func dataTask(with request: URLRequest, handler: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
        dataTask(with: request) { data, _, error in
            if let error = error {
                handler(.failure(error))
            } else {
                handler(.success(data ?? Data()))
            }
        }
    }
}
