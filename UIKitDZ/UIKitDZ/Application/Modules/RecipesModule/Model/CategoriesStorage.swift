// CategoriesStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Источник данных для экранов категорий, блюд и рецептов
struct CategoriesStorage {
    lazy var categories = [
        Category(
            categoryName: Constants.categoryName1,
            categoryImageName: Constants.categoryImageName1,
            dishes: saladDishes
        ),
        Category(
            categoryName: Constants.categoryName2,
            categoryImageName: Constants.categoryImageName2,
            dishes: soupDishes
        ),
        Category(
            categoryName: Constants.categoryName3,
            categoryImageName: Constants.categoryImageName3,
            dishes: chickenDishes
        ),
        Category(
            categoryName: Constants.categoryName4,
            categoryImageName: Constants.categoryImageName4,
            dishes: meatDishes
        ),
        Category(
            categoryName: Constants.categoryName5,
            categoryImageName: Constants.categoryImageName5,
            dishes: fishDishes
        ),
        Category(
            categoryName: Constants.categoryName6,
            categoryImageName: Constants.categoryImageName6,
            dishes: sideDishDishes
        ),
        Category(
            categoryName: Constants.categoryName7,
            categoryImageName: Constants.categoryImageName7,
            dishes: drinkDishes
        ),
        Category(
            categoryName: Constants.categoryName8,
            categoryImageName: Constants.categoryImageName8,
            dishes: pancakeDishes
        ),
        Category(
            categoryName: Constants.categoryName9,
            categoryImageName: Constants.categoryImageName9,
            dishes: dessertDishes
        )
    ]

    let saladDishes = SaladDishes().saladDishes
    let soupDishes = SoupDishes().soupDishes
    let chickenDishes = ChickenDishes().chickenDishes
    let meatDishes = MeatDishes().meatDishes
    let fishDishes = FishDishes().fishDishes
    let sideDishDishes = SideDishDishes().sideDishDishes
    let drinkDishes = DrinkDishes().drinkDishes
    let pancakeDishes = PancakeDishes().pancakeDishes
    let dessertDishes = DessertDishes().dessertDishes

    // MARK: - Constants

    /// Источник данных для категорий
    enum Constants {
        static let categoryName1 = "Salad"
        static let categoryImageName1 = "salad"

        static let categoryName2 = "Soup"
        static let categoryImageName2 = "soup"

        static let categoryName3 = "Chicken"
        static let categoryImageName3 = "chicken"

        static let categoryName4 = "Meat"
        static let categoryImageName4 = "meat"

        static let categoryName5 = "Fish"
        static let categoryImageName5 = "fish"

        static let categoryName6 = "Side dish"
        static let categoryImageName6 = "sideDish"

        static let categoryName7 = "Drinks"
        static let categoryImageName7 = "drinks"

        static let categoryName8 = "Pancake"
        static let categoryImageName8 = "pancakes"

        static let categoryName9 = "Desserts"
        static let categoryImageName9 = "desserts"
    }
}
