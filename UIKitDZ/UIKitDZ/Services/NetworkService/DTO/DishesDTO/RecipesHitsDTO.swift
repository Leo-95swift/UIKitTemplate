// RecipesHitsDTO.swift
// Copyright © RoadMap. All rights reserved.

/// Для получения списка всех блюд
struct RecipesHitsDTO: Codable {
    /// Массив с рецептами
    let hits: [RecipeHitDTO]
}
