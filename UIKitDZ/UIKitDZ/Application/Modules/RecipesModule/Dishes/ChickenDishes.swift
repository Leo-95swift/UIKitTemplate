// ChickenDishes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Источник данных для категории
// struct ChickenDishes {
//    let chickenDishes = [
//        Dish(
//            dishName: Constants.dishName19,
//            dishImageName: Constants.dishImageName19,
//            cookTime: Constants.cookTime19,
//            totalWeight: Constants.caloriesSum19,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal19,
//                carbohydrates: Constants.Carbohydrates19,
//                fats: Constants.Fats19,
//                proteins: Constants.Proteins19
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName20,
//            dishImageName: Constants.dishImageName20,
//            cookTime: Constants.cookTime20,
//            totalWeight: Constants.caloriesSum20,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal20,
//                carbohydrates: Constants.Carbohydrates20,
//                fats: Constants.Fats20,
//                proteins: Constants.Proteins20
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName21,
//            dishImageName: Constants.dishImageName21,
//            cookTime: Constants.cookTime21,
//            totalWeight: Constants.caloriesSum21,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal21,
//                carbohydrates: Constants.Carbohydrates21,
//                fats: Constants.Fats21,
//                proteins: Constants.Proteins21
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName22,
//            dishImageName: Constants.dishImageName22,
//            cookTime: Constants.cookTime22,
//            totalWeight: Constants.caloriesSum22,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal22,
//                carbohydrates: Constants.Carbohydrates22,
//                fats: Constants.Fats22,
//                proteins: Constants.Proteins22
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName23,
//            dishImageName: Constants.dishImageName23,
//            cookTime: Constants.cookTime23,
//            totalWeight: Constants.caloriesSum23,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal23,
//                carbohydrates: Constants.Carbohydrates23,
//                fats: Constants.Fats23,
//                proteins: Constants.Proteins23
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName24,
//            dishImageName: Constants.dishImageName24,
//            cookTime: Constants.cookTime24,
//            totalWeight: Constants.caloriesSum24,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal24,
//                carbohydrates: Constants.Carbohydrates24,
//                fats: Constants.Fats24,
//                proteins: Constants.Proteins24
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName25,
//            dishImageName: Constants.dishImageName25,
//            cookTime: Constants.cookTime25,
//            totalWeight: Constants.caloriesSum25,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal25,
//                carbohydrates: Constants.Carbohydrates25,
//                fats: Constants.Fats25,
//                proteins: Constants.Proteins25
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName26,
//            dishImageName: Constants.dishImageName26,
//            cookTime: Constants.cookTime26,
//            totalWeight: Constants.caloriesSum26,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal26,
//                carbohydrates: Constants.Carbohydrates26,
//                fats: Constants.Fats26,
//                proteins: Constants.Proteins26
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName27,
//            dishImageName: Constants.dishImageName27,
//            cookTime: Constants.cookTime27,
//            totalWeight: Constants.caloriesSum27,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal27,
//                carbohydrates: Constants.Carbohydrates27,
//                fats: Constants.Fats27,
//                proteins: Constants.Proteins27
//            ),
//            recipe: DishRecipe.recipe
//        )
//    ]
//
//    enum Constants {
//        static let dishName19 = "Spicy Grilled Chicken"
//        static let dishImageName19 = "chicken1"
//        static let cookTime19 = "30 min"
//        static let caloriesSum19 = "350 g"
//        static let EnercKcal19 = "450 kcal"
//        static let Carbohydrates19 = "0 g"
//        static let Fats19 = "10 g"
//        static let Proteins19 = "80 g"
//
//        static let dishName20 = "Honey Mustard Chicken Breast"
//        static let dishImageName20 = "chicken2"
//        static let cookTime20 = "45 min"
//        static let caloriesSum20 = "300 g"
//        static let EnercKcal20 = "510 kcal"
//        static let Carbohydrates20 = "15 g"
//        static let Fats20 = "22 g"
//        static let Proteins20 = "58 g"
//
//        static let dishName21 = "Garlic Lemon Chicken Thighs"
//        static let dishImageName21 = "chicken3"
//        static let cookTime21 = "60 min"
//        static let caloriesSum21 = "400 g"
//        static let EnercKcal21 = "600 kcal"
//        static let Carbohydrates21 = "5 g"
//        static let Fats21 = "40 g"
//        static let Proteins21 = "55 g"
//
//        static let dishName22 = "BBQ Chicken Wings"
//        static let dishImageName22 = "chicken4"
//        static let cookTime22 = "90 min"
//        static let caloriesSum22 = "450 g"
//        static let EnercKcal22 = "750 kcal"
//        static let Carbohydrates22 = "25 g"
//        static let Fats22 = "45 g"
//        static let Proteins22 = "35 g"
//
//        static let dishName23 = "Chicken Parmesan"
//        static let dishImageName23 = "chicken5"
//        static let cookTime23 = "35 min"
//        static let caloriesSum23 = "320 g"
//        static let EnercKcal23 = "580 kcal"
//        static let Carbohydrates23 = "40 g"
//        static let Fats23 = "24 g"
//        static let Proteins23 = "48 g"
//
//        static let dishName24 = "Chicken Alfredo Pasta"
//        static let dishImageName24 = "chicken6"
//        static let cookTime24 = "25 min"
//        static let caloriesSum24 = "500 g"
//        static let EnercKcal24 = "950 kcal"
//        static let Carbohydrates24 = "75 g"
//        static let Fats24 = "35 g"
//        static let Proteins24 = "40 g"
//
//        static let dishName25 = "Teriyaki Chicken Bowl"
//        static let dishImageName25 = "chicken7"
//        static let cookTime25 = "30 min"
//        static let caloriesSum25 = "380 g"
//        static let EnercKcal25 = "620 kcal"
//        static let Carbohydrates25 = "85 g"
//        static let Fats25 = "10 g"
//        static let Proteins25 = "26 g"
//
//        static let dishName26 = "Chicken Vegetable Stir Fry"
//        static let dishImageName26 = "chicken8"
//        static let cookTime26 = "20 min"
//        static let caloriesSum26 = "365 g"
//        static let EnercKcal26 = "475 kcal"
//        static let Carbohydrates26 = "35 g"
//        static let Fats26 = "15 g"
//        static let Proteins26 = "40 g"
//
//        static let dishName27 = "Buffalo Chicken Salad"
//        static let dishImageName27 = "chicken9"
//        static let cookTime27 = "15 min"
//        static let caloriesSum27 = "290 g"
//        static let EnercKcal27 = "420 kcal"
//        static let Carbohydrates27 = "12 g"
//        static let Fats27 = "20 g"
//        static let Proteins27 = "38 g"
//    }
// }
