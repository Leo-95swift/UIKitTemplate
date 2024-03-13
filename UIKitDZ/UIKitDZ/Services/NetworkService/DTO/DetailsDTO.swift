// DetailsDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// struct AllDishes: Decodable {
//    let hits: [DetailsDTO]
// }

// Структура данных рецептов
struct DetailsDTO: Decodable {
    let image: String
    let label: String
    let totalTime: Double
    let calories: Double
    let images: ImagesDTO
    let totalWeight: Double
    let totalNutrients: TotalNutrientsDTO
    let ingridientLines: [String]
}

// Структура данных картинок
struct ImagesDTO: Decodable {
    let regular: LagreDTO
}

// Структура данных ссылки на картинку
struct LagreDTO: Decodable {
    let url: String
}

// Структура данных питательных веществ
struct TotalNutrientsDTO: Decodable {
    let kcal: String
    let carbohydrates: String
    let fats: String
    let proteins: String

    // Перечисление ключей кодирования
    enum CodingKeys: String, CodingKey {
        case kcal = "ENERC_KCAL" // для калорий
        case carbohydrates = "CHOCDF" // для углеводов
        case fats = "FAT" // для жиров
        case proteins = "PROCNT" // для белков
    }
}
