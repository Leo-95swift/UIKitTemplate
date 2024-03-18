// DishDetailDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Структура данных рецептов
struct DishDetailDTO: Codable {
    let image: String
    let label: String
    let totalTime: Int
    let calories: Double
    let images: ImagesDTO
    let totalWeight: Double
    let totalNutrients: TotalNutrientsDTO
    let ingredientLines: [String]
}

// MARK: - Recipe

// struct Recipe: Codable {
//    let uri: String
//    let label: String
//    let image: String
//    let images: Images
//    let source: String
//    let url: String
//    let shareAs: String
//    let yield: Int
//    let dietLabels, healthLabels: [String]
//    let cautions: [JSONAny]
//    let ingredientLines: [String]
//    let ingredients: [Ingredient]
//    let calories, totalCO2Emissions: Double
//    let co2EmissionsClass: String
//    let totalWeight: Double
//    let totalTime: Int
//    let cuisineType, mealType, dishType: [String]
//    let totalNutrients, totalDaily: [String: Total]
//    let digest: [Digest]
//    let tags: [String]
// }
