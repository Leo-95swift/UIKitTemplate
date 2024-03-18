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
    var calories: Int
    // Картинка рецепта
    let images: String
    // Масса рецепта
    let totalWeight: Double
//    // КБЖУ
//    let totalNutrients: TotalNutrientsDTO
    let fats: Double
    let proteins: Double
    let chocdf: Double
    // Описание рецепта
    let ingridientLines: String

    init(dto: DishDetailDTO) {
        label = dto.label
        totalTime = Int(dto.totalTime)
        calories = Int(dto.calories)
        images = dto.images.regular.url
        totalWeight = dto.totalWeight
        fats = dto.totalNutrients.fat.quantity
        proteins = dto.totalNutrients.protein.quantity
        chocdf = dto.totalNutrients.chocdf.quantity
        calories = Int(dto.totalNutrients.calories.quantity)
        ingridientLines = dto.ingredientLines.joined(separator: "\n")
    }

    init(CDdishDetail: CoreDataDishDetail) {
        label = CDdishDetail.label
        totalTime = Int(CDdishDetail.totalTime)
        totalWeight = CDdishDetail.totalWeight
        calories = Int(CDdishDetail.calories)
        chocdf = CDdishDetail.chocdf
        fats = CDdishDetail.fats
        proteins = CDdishDetail.proteins
        images = CDdishDetail.images ?? ""
        ingridientLines = CDdishDetail.ingredientLines
    }
}
