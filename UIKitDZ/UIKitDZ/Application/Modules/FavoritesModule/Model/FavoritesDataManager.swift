// FavoritesDataManager.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Для добавления и использования избранных блюд из экрана блюд
final class FavoritesDataManager {
    // MARK: - Constants

    static let shared = FavoritesDataManager()

    // MARK: - Initializers

    private init() {}

    // MARK: - Public Properties

    var sharedDataMap: [String: Dish] = [:]

    // MARK: - Public Methodes

    func updateStateForDish(_ dishName: String, dish: Dish) {
        if sharedDataMap[dishName] == nil {
            sharedDataMap[dishName] = dish
        } else {
            sharedDataMap[dishName] = nil
        }
    }
}
