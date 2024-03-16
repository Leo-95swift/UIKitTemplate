// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол NetworkServiceProtocol
protocol NetworkServiceProtocol {
    /// Получение рецепта через JSON
    func getDishes(dishType: String, completionHandler: @escaping (Result<[Dish], Error>) -> Void)
//    /// Для получения детальной информации о рицепте
    func getDishesDetail(
        _ uri: String,
        completionHandler: @escaping (Result<DishDetail, Error>) -> Void
    )
}

/// шйоншр
final class NetworkService: NetworkServiceProtocol {
    // MARK: - Constants

    private enum Constants {
        static let scheme = "https"
        static let host = "api.edamam.com"
        static let path = "/api/recipes/v2"
        static let pathWithUri = "/api/recipes/v2/by-uri"
        static let componentsTypeKey = "type"
        static let identefire = "app_id"
        static let componnentsAppKey = "app_key"
        static let componentsDishTypeKey = "dishType"
        static let type = "public"
        static let appKey = "2412c4c0d52ca924f6d6a486c1aa1ab6"
        static let appId = "a726fb9c"
        static let dishType = "dishType"
    }

    private var session = URLSession.shared

    private func createURLComponents(dishType: String, path: String) -> URLComponents {
        var component = URLComponents()
        component.scheme = Constants.scheme
        component.host = Constants.host
        component.queryItems = createURLQueryItems(dishType: dishType)
        component.path = path

        return component
    }

    private func createURLQueryItems(dishType: String) -> [URLQueryItem] {
        [
            URLQueryItem(
                name: Constants.componentsTypeKey,
                value: Constants.type
            ),
            URLQueryItem(
                name: Constants.identefire,
                value: Constants.appId
            ),
            URLQueryItem(
                name: Constants.componnentsAppKey,
                value: Constants.appKey
            ),
            URLQueryItem(
                name: Constants.componentsDishTypeKey,
                value: dishType
            )
        ]
    }

    func getDishes(dishType: String, completionHandler: @escaping (Result<[Dish], Error>) -> Void) {
        let component = createURLComponents(
            dishType: dishType,
            path: Constants.path
        )

        guard let url = component.url else { return }
        let request = URLRequest(url: url)
        session.dataTask(with: request) { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    do {
                        let allHits = try JSONDecoder().decode(RecipesHitsDTO.self, from: data)
                        let hits = allHits.hits
                        var recipes: [Dish] = []
                        for hit in hits {
                            recipes.append(Dish(dish: hit.recipe))
                        }
                        completionHandler(.success(recipes))
                        print(recipes)
                    } catch {
                        completionHandler(.failure(error))
                        print(error.localizedDescription)
                    }
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            }
        }.resume()
    }

    func getDishesDetail(_ uri: String, completionHandler: @escaping (Result<DishDetail, Error>) -> Void) {
        let urlQueryItemsDetail: [URLQueryItem] = [
            .init(name: "uri", value: uri)
        ]
        var component = createURLComponents(
            dishType: "Salad",
            path: Constants.pathWithUri
        )
        component.queryItems?.append(contentsOf: urlQueryItemsDetail)
        guard let url = component.url else { return }
        let request = URLRequest(url: url)
        session.dataTask(with: request) { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    do {
                        let dishHitsDTO = try JSONDecoder().decode(DishHitsDTO.self, from: data)
                        guard let result = dishHitsDTO.hits.first?.recipe
                        else { return }
                        let recipe = result
                        let detail = DishDetail(dto: recipe)
                        completionHandler(.success(detail))
                    } catch {
                        completionHandler(.failure(error))
                    }
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            }
        }.resume()
    }
}
