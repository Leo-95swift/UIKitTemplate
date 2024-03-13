// DishesDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// MARK: - AllDishes

/// краткое описание ...
struct AllDishes: Codable {
    let hits: [Hit]
}

/// краткое описание ...
struct Hit: Codable {
    let recipe: Recipe
}

/// краткое описание ...
struct Recipe: Codable {
    let uri: String
    let label: String
    let image: String
    let images: Images
    let url: String
    let shareAs: String
    let yield: Int
    let dietLabels, healthLabels, cautions, ingredientLines: [String]
    let ingredients: [Ingredient]
    let calories, totalCO2Emissions: Double
    let totalWeight, totalTime: Double
    let totalNutrients, totalDaily: [String: Total]
    let digest: [Digest]
}

/// краткое описание ...
struct Digest: Codable {
    let label: Label
    let tag: String
    let schemaOrgTag: SchemaOrgTag?
    let total: Double
    let hasRDI: Bool
    let daily: Double
    let unit: Unit
    let sub: [Digest]?
}

/// енум
enum Label: String, Codable {
    case calcium = "Calcium"
    case carbohydratesNet = "Carbohydrates (net)"
    case carbs = "Carbs"
    case carbsNet = "Carbs (net)"
    case cholesterol = "Cholesterol"
    case energy = "Energy"
    case fat = "Fat"
    case fiber = "Fiber"
    case folateEquivalentTotal = "Folate equivalent (total)"
    case folateFood = "Folate (food)"
    case folicAcid = "Folic acid"
    case iron = "Iron"
    case magnesium = "Magnesium"
    case monounsaturated = "Monounsaturated"
    case niacinB3 = "Niacin (B3)"
    case phosphorus = "Phosphorus"
    case polyunsaturated = "Polyunsaturated"
    case potassium = "Potassium"
    case protein = "Protein"
    case riboflavinB2 = "Riboflavin (B2)"
    case saturated = "Saturated"
    case sodium = "Sodium"
    case sugarAlcohols = "Sugar alcohols"
    case sugars = "Sugars"
    case sugarsAdded = "Sugars, added"
    case thiaminB1 = "Thiamin (B1)"
    case trans = "Trans"
    case vitaminA = "Vitamin A"
    case vitaminB12 = "Vitamin B12"
    case vitaminB6 = "Vitamin B6"
    case vitaminC = "Vitamin C"
    case vitaminD = "Vitamin D"
    case vitaminE = "Vitamin E"
    case vitaminK = "Vitamin K"
    case water = "Water"
    case zinc = "Zinc"
}

/// енум
enum SchemaOrgTag: String, Codable {
    case carbohydrateContent
    case cholesterolContent
    case fatContent
    case fiberContent
    case proteinContent
    case saturatedFatContent
    case sodiumContent
    case sugarContent
    case transFatContent
}

/// енум
enum Unit: String, Codable {
    case empty = "%"
    // swiftlint:disable all
    case g
    // swiftlint:enable all
    case kcal
    case mg
    case µg
}

/// краткое описание ...
struct Images: Codable {
    let thumbnail, small, regular: Large
    let large: Large?

    enum CodingKeys: String, CodingKey {
        case thumbnail = "THUMBNAIL"
        case small = "SMALL"
        case regular = "REGULAR"
        case large = "LARGE"
    }
}

/// краткое описание ...
struct Large: Codable {
    let url: String
    let width, height: Int
}

/// краткое описание ...
struct Ingredient: Codable {
    let text: String
    let quantity: Double
    let measure: String?
    let food: String
    let weight: Double
    let foodCategory, foodID: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case text, quantity, measure, food, weight, foodCategory
        case foodID = "foodId"
        case image
    }
}

/// краткое описание ...
struct Total: Codable {
    let label: Label
    let quantity: Double
    let unit: Unit
}
