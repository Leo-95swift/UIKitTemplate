// Dish.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Все блюда данной категории
class Dish {
    // Название блюда
    let dishName: String
    // Картинка для блюда
    let dishImageName: String
    // Время приготовления
    let cookTime: Double
    // Суммарное количество колорий
    let totalWeight: Double
    // Количество калорий
    let nutrients: Nutrients
    // Рецепт приготовления
    let recipe: String
    // Uri для блюдо
    let uri: String

    init(dish: RecipeDTO) {
        dishName = dish.label
        dishImageName = dish.image
        cookTime = dish.totalTime
        totalWeight = dish.totalWeight

        nutrients = Nutrients(
            enercKcal: "enercKcal",
            carbohydrates: "carbohydrates",
            fats: "fats",
            proteins: "proteins"
        )
        recipe = "recipe"
        uri = dish.uri
    }

    init(CDdish: CoreDataDish) {
        dishName = CDdish.dishName
        dishImageName = CDdish.dishImageName
        cookTime = CDdish.cookTime
        totalWeight = CDdish.totalWeight
        uri = CDdish.uri
        nutrients = Nutrients(
            enercKcal: "enercKcal",
            carbohydrates: "carbohydrates",
            fats: "fats",
            proteins: "proteins"
        )
        recipe = "recipe"
    }
}
