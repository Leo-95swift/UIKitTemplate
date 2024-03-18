// URLSession+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

extension URLSession {
    func dataTask(
        with request: URLRequest,
        handler: @escaping (Result<Data, SessionError>) -> Void
    ) -> URLSessionDataTask {
        dataTask(with: request) { data, response, error in
            if error != nil {
                handler(.failure(.networkFailure))
            } else if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200:
                    handler(.success(data ?? Data()))
                default:
                    handler(.failure(.invalidStatusCode))
                }
            }
        }
    }
}

/// Кастомный еррор для обработки ошибок URLSession
public enum SessionError: Error {
    case networkFailure
    case invalidStatusCode
}
