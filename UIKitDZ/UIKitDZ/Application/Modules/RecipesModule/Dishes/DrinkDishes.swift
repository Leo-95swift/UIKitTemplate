// DrinkDishes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Источник данных для категории
// struct DrinkDishes {
//    let drinkDishes = [
//        Dish(
//            dishName: Constants.dishName55,
//            dishImageName: Constants.dishImageName55,
//            cookTime: Constants.cookTime55,
//            totalWeight: Constants.caloriesSum55,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal55,
//                carbohydrates: Constants.Carbohydrates55,
//                fats: Constants.Fats55,
//                proteins: Constants.Proteins55
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName56,
//            dishImageName: Constants.dishImageName56,
//            cookTime: Constants.cookTime56,
//            totalWeight: Constants.caloriesSum56,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal56,
//                carbohydrates: Constants.Carbohydrates56,
//                fats: Constants.Fats56,
//                proteins: Constants.Proteins56
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName57,
//            dishImageName: Constants.dishImageName57,
//            cookTime: Constants.cookTime57,
//            totalWeight: Constants.caloriesSum57,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal57,
//                carbohydrates: Constants.Carbohydrates57,
//                fats: Constants.Fats57,
//                proteins: Constants.Proteins57
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName58,
//            dishImageName: Constants.dishImageName58,
//            cookTime: Constants.cookTime58,
//            totalWeight: Constants.caloriesSum58,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal58,
//                carbohydrates: Constants.Carbohydrates58,
//                fats: Constants.Fats58,
//                proteins: Constants.Proteins58
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName59,
//            dishImageName: Constants.dishImageName59,
//            cookTime: Constants.cookTime59,
//            totalWeight: Constants.caloriesSum59,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal59,
//                carbohydrates: Constants.Carbohydrates59,
//                fats: Constants.Fats59,
//                proteins: Constants.Proteins59
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName60,
//            dishImageName: Constants.dishImageName60,
//            cookTime: Constants.cookTime60,
//            totalWeight: Constants.caloriesSum60,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal60,
//                carbohydrates: Constants.Carbohydrates60,
//                fats: Constants.Fats60,
//                proteins: Constants.Proteins60
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName61,
//            dishImageName: Constants.dishImageName61,
//            cookTime: Constants.cookTime61,
//            totalWeight: Constants.caloriesSum61,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal61,
//                carbohydrates: Constants.Carbohydrates61,
//                fats: Constants.Fats61,
//                proteins: Constants.Proteins61
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName62,
//            dishImageName: Constants.dishImageName62,
//            cookTime: Constants.cookTime62,
//            totalWeight: Constants.caloriesSum62,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal62,
//                carbohydrates: Constants.Carbohydrates62,
//                fats: Constants.Fats62,
//                proteins: Constants.Proteins62
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName63,
//            dishImageName: Constants.dishImageName63,
//            cookTime: Constants.cookTime63,
//            totalWeight: Constants.caloriesSum63,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal63,
//                carbohydrates: Constants.Carbohydrates63,
//                fats: Constants.Fats63,
//                proteins: Constants.Proteins63
//            ),
//            recipe: DishRecipe.recipe
//        )
//    ]
//
//    enum Constants {
//        static let dishName55 = "Classic Mojito"
//        static let dishImageName55 = "drink1"
//        static let cookTime55 = "5 min"
//        static let caloriesSum55 = "180 g"
//        static let EnercKcal55 = "215 kcal"
//        static let Carbohydrates55 = "25 g"
//        static let Fats55 = "0 g"
//        static let Proteins55 = "0 g"
//
//        static let dishName56 = "Fresh Strawberry Lemonade"
//        static let dishImageName56 = "drink2"
//        static let cookTime56 = "10 min"
//        static let caloriesSum56 = "200 g"
//        static let EnercKcal56 = "150 kcal"
//        static let Carbohydrates56 = "40 g"
//        static let Fats56 = "0 g"
//        static let Proteins56 = "0 g"
//
//        static let dishName57 = "Iced Matcha Latte"
//        static let dishImageName57 = "drink3"
//        static let cookTime57 = "7 min"
//        static let caloriesSum57 = "250 g"
//        static let EnercKcal57 = "120 kcal"
//        static let Carbohydrates57 = "18 g"
//        static let Fats57 = "4 g"
//        static let Proteins57 = "3 g"
//
//        static let dishName58 = "Pineapple Smoothie"
//        static let dishImageName58 = "drink4"
//        static let cookTime58 = "5 min"
//        static let caloriesSum58 = "300 g"
//        static let EnercKcal58 = "180 kcal"
//        static let Carbohydrates58 = "45 g"
//        static let Fats58 = "1 g"
//        static let Proteins58 = "2 g"
//
//        static let dishName59 = "Cold Brew Coffee"
//        static let dishImageName59 = "drink5"
//        static let cookTime59 = "480 min"
//        static let caloriesSum59 = "160 g"
//        static let EnercKcal59 = "5 kcal"
//        static let Carbohydrates59 = "1 g"
//        static let Fats59 = "0 g"
//        static let Proteins59 = "0 g"
//
//        static let dishName60 = "Ginger Turmeric Tea"
//        static let dishImageName60 = "drink6"
//        static let cookTime60 = "15 min"
//        static let caloriesSum60 = "200 g"
//        static let EnercKcal60 = "10 kcal"
//        static let Carbohydrates60 = "2 g"
//        static let Fats60 = "0 g"
//        static let Proteins60 = "0 g"
//
//        static let dishName61 = "Blueberry Protein Shake"
//        static let dishImageName61 = "drink7"
//        static let cookTime61 = "5 min"
//        static let caloriesSum61 = "250 g"
//        static let EnercKcal61 = "220 kcal"
//        static let Carbohydrates61 = "18 g"
//        static let Fats61 = "2 g"
//        static let Proteins61 = "30 g"
//
//        static let dishName62 = "Watermelon Mint Juice"
//        static let dishImageName62 = "drink8"
//        static let cookTime62 = "10 min"
//        static let caloriesSum62 = "250 g"
//        static let EnercKcal62 = "100 kcal"
//        static let Carbohydrates62 = "25 g"
//        static let Fats62 = "0.5 g"
//        static let Proteins62 = "2 g"
//
//        static let dishName63 = "Hot Chocolate with Marshmallows"
//        static let dishImageName63 = "drink9"
//        static let cookTime63 = "10 min"
//        static let caloriesSum63 = "300 g"
//        static let EnercKcal63 = "350 kcal"
//        static let Carbohydrates63 = "50 g"
//        static let Fats63 = "12 g"
//        static let Proteins63 = "8 g"
//    }
// }
