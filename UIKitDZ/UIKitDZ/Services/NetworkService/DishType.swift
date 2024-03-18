// DishType.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Перечисление, для типов блюд.
enum DishType: String {
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
