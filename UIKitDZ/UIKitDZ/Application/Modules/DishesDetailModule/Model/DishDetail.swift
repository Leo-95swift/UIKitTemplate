// DishDetail.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// weihbdiehb
final class DishDetail {
    /// Заголовок
    let label: String
    /// Время приготовления
    let totalTime: Int
    /// Кол-во калорий
    let calories: Int
    // Картинка рецепта
    let images: String
    // Масса рецепта
    let totalWeight: Double
    // КБЖУ
    let totalNutrients: TotalNutrientsDTO
    // Описание рецепта
    let ingridientLines: [String]

    init(dto: DishDetailDTO) {
        label = dto.label
        totalTime = Int(dto.totalTime)
        calories = Int(dto.calories)
        images = dto.images.regular.url
        totalWeight = dto.totalWeight
        totalNutrients = dto.totalNutrients
        ingridientLines = dto.ingredientLines
    }
}