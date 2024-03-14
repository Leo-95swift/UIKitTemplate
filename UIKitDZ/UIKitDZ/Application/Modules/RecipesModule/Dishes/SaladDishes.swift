// SaladDishes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Источник данных для категории
// struct SaladDishes {
//    let saladDishes = [
//        Dish(
//            dishName: Constants.dishName1,
//            dishImageName: Constants.dishImageName1,
//            cookTime: Constants.cookTime1,
//            totalWeight: Constants.coloriesSum1,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal1,
//                carbohydrates: Constants.Carbohydrates1,
//                fats: Constants.Fats1,
//                proteins: Constants.Proteins1
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName2,
//            dishImageName: Constants.dishImageName2,
//            cookTime: Constants.cookTime2,
//            totalWeight: Constants.caloriesSum2,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal2,
//                carbohydrates: Constants.Carbohydrates2,
//                fats: Constants.Fats2,
//                proteins: Constants.Proteins2
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName3,
//            dishImageName: Constants.dishImageName3,
//            cookTime: Constants.cookTime3,
//            totalWeight: Constants.caloriesSum3,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal3,
//                carbohydrates: Constants.Carbohydrates3,
//                fats: Constants.Fats3,
//                proteins: Constants.Proteins3
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName4,
//            dishImageName: Constants.dishImageName4,
//            cookTime: Constants.cookTime4,
//            totalWeight: Constants.caloriesSum4,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal4,
//                carbohydrates: Constants.Carbohydrates4,
//                fats: Constants.Fats4,
//                proteins: Constants.Proteins4
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName5,
//            dishImageName: Constants.dishImageName5,
//            cookTime: Constants.cookTime5,
//            totalWeight: Constants.caloriesSum5,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal5,
//                carbohydrates: Constants.Carbohydrates5,
//                fats: Constants.Fats5,
//                proteins: Constants.Proteins5
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName6,
//            dishImageName: Constants.dishImageName6,
//            cookTime: Constants.cookTime6,
//            totalWeight: Constants.caloriesSum6,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal6,
//                carbohydrates: Constants.Carbohydrates6,
//                fats: Constants.Fats6,
//                proteins: Constants.Proteins6
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName7,
//            dishImageName: Constants.dishImageName7,
//            cookTime: Constants.cookTime7,
//            totalWeight: Constants.caloriesSum7,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal7,
//                carbohydrates: Constants.Carbohydrates7,
//                fats: Constants.Fats7,
//                proteins: Constants.Proteins7
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName8,
//            dishImageName: Constants.dishImageName8,
//            cookTime: Constants.cookTime8,
//            totalWeight: Constants.caloriesSum8,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal8,
//                carbohydrates: Constants.Carbohydrates8,
//                fats: Constants.Fats8,
//                proteins: Constants.Proteins8
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName9,
//            dishImageName: Constants.dishImageName9,
//            cookTime: Constants.cookTime9,
//            totalWeight: Constants.caloriesSum9,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal9,
//                carbohydrates: Constants.Carbohydrates9,
//                fats: Constants.Fats9,
//                proteins: Constants.Proteins9
//            ),
//            recipe: DishRecipe.recipe
//        )
//    ]
//
//    // MARK: - Salad
//
//    enum Constants {
//        static let dishName1 = "Simple Fish And Corn"
//        static let dishImageName1 = "salad1"
//        static let cookTime1 = "60 min"
//        static let coloriesSum1 = "274 g"
//        static let EnercKcal1 = "1322 kcal"
//        static let Carbohydrates1 = "10,78 g"
//        static let Fats1 = "10,00 g"
//        static let Proteins1 = "97,30 g"
//
//        static let dishName2 = "Creamy Pumpkin Delight"
//        static let dishImageName2 = "salad2"
//        static let cookTime2 = "60 min"
//        static let caloriesSum2 = "210 g"
//        static let EnercKcal2 = "879 kcal"
//        static let Carbohydrates2 = "25.34 g"
//        static let Fats2 = "7.89 g"
//        static let Proteins2 = "6.45 g"
//
//        static let dishName3 = "Herb Infused Roast Chicken"
//        static let dishImageName3 = "salad3"
//        static let cookTime3 = "90 min"
//        static let caloriesSum3 = "360 g"
//        static let EnercKcal3 = "1505 kcal"
//        static let Carbohydrates3 = "0 g"
//        static let Fats3 = "20.43 g"
//        static let Proteins3 = "44.50 g"
//
//        static let dishName4 = "Grilled Steak Perfection"
//        static let dishImageName4 = "salad4"
//        static let cookTime4 = "90 min"
//        static let caloriesSum4 = "500 g"
//        static let EnercKcal4 = "2093 kcal"
//        static let Carbohydrates4 = "0 g"
//        static let Fats4 = "30.75 g"
//        static let Proteins4 = "48.90 g"
//
//        static let dishName5 = "Lemon Garlic Tilapia"
//        static let dishImageName5 = "salad5"
//        static let cookTime5 = "90 min"
//        static let caloriesSum5 = "220 g"
//        static let EnercKcal5 = "920 kcal"
//        static let Carbohydrates5 = "3 g"
//        static let Fats5 = "12.50 g"
//        static let Proteins5 = "34 g"
//
//        static let dishName6 = "Buttery Mashed Potatoes"
//        static let dishImageName6 = "salad6"
//        static let cookTime6 = "35 min"
//        static let caloriesSum6 = "190 g"
//        static let EnercKcal6 = "795 kcal"
//        static let Carbohydrates6 = "37.85 g"
//        static let Fats6 = "6.77 g"
//        static let Proteins6 = "4.22 g"
//
//        static let dishName7 = "Sparkling Berry Fusion"
//        static let dishImageName7 = "salad1"
//        static let cookTime7 = "35 min"
//        static let caloriesSum7 = "150 g"
//        static let EnercKcal7 = "628 kcal"
//        static let Carbohydrates7 = "18.00 g"
//        static let Fats7 = "0 g"
//        static let Proteins7 = "0 g"
//
//        static let dishName8 = "Maple Bliss Pancakes"
//        static let dishImageName8 = "salad2"
//        static let cookTime8 = "25 min"
//        static let caloriesSum8 = "290 g"
//        static let EnercKcal8 = "1214 kcal"
//        static let Carbohydrates8 = "58.30 g"
//        static let Fats8 = "6.00 g"
//        static let Proteins8 = "8.20 g"
//
//        static let dishName9 = "Chocolate Dream Cake"
//        static let dishImageName9 = "salad4"
//        static let cookTime9 = "60 min"
//        static let caloriesSum9 = "450 g"
//        static let EnercKcal9 = "1883 kcal"
//        static let Carbohydrates9 = "50.76 g"
//        static let Fats9 = "25.89 g"
//        static let Proteins9 = "5.32 g"
//    }
// }
