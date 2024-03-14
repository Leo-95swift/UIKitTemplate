// TotalNutrientsDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// КБЖУ для детального рецепта
struct TotalNutrientsDTO: Codable {
    /// Калории
    let calories: TotalDTO
    /// Жиры
    let fat: TotalDTO
    /// Белки
    let protein: TotalDTO
    /// Углеводы
    let chocdf: TotalDTO

    /// Названия ключей
    enum CodingKeys: String, CodingKey {
        /// Ключ calories
        case calories = "ENERC_KCAL"
        /// Ключ fat
        case fat = "FAT"
        /// Ключ protein
        case protein = "PROCNT"
        /// Ключ chocdf
        case chocdf = "CHOCDF"
    }
}
