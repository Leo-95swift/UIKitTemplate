// DishHitsDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Для получения списка всех блюд
struct DishHitsDTO: Codable {
    /// Массив с рецептами
    let hits: [DishHitDTO]
}
