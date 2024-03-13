// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// шйоншр
final class NetworkService {
    // MARK: - DishType

    enum DishType {
        case salad, soup, chicken, meat, fish, sideDish, pancake, drinks, desserts

        var dishCategory: String {
            switch self {
            case .salad:
                return "Salad"
            case .soup:
                return "Soup"
            case .chicken, .meat, .fish, .sideDish:
                return "Main course"
            case .pancake:
                return "Salad"
            case .drinks:
                return "Drinks"
            case .desserts:
                return "Desserts"
            }
        }
    }

    var component = URLComponents()
    var scheme = "https"
    var host = "api.edamam.com"
    var path = "/api/recipes/v2"
    var urlQueryItems: [URLQueryItem] = [
        .init(name: "type", value: "public"),
        .init(name: "app_id", value: "a726fb9c"),
        .init(name: "app_key", value: "2412c4c0d52ca924f6d6a486c1aa1ab6"),
        .init(name: "dishType", value: DishType.salad.dishCategory)
    ]

    func getDishes(completionHandler: @escaping (Result<AllDishes, Error>) -> Void) {
        component.scheme = scheme
        component.host = host
        component.queryItems = urlQueryItems
        component.path = path

        guard let url = component.url else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            if let data = data {
                do {
                    let allDishes = try JSONDecoder().decode(AllDishes.self, from: data)
                    let hits = allDishes.hits
                    var recipes: [Recipe] = []
                    for hit in hits {
                        recipes.append(hit.recipe)
                    }
                    print(recipes)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
