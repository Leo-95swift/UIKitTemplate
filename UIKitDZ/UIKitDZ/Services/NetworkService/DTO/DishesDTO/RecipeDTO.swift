// RecipeDTO.swift
// Copyright © RoadMap. All rights reserved.

/// Описание блюдо
struct RecipeDTO: Codable {
    // Для идентификации ресурса
    let uri: String
    // Название рицепта
    let label: String
    // Фото рицепта
    let image: String
    // Количество калорий
    let calories: Double
    // Общее время приготовления
    let totalTime: Double
    // Общий вес рицепта
    let totalWeight: Double
}
