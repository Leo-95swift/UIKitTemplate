// PancakeDishes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Источник данных для категории
// struct PancakeDishes {
//    let pancakeDishes = [
//        Dish(
//            dishName: Constants.dishName64,
//            dishImageName: Constants.dishImageName64,
//            cookTime: Constants.cookTime64,
//            totalWeight: Constants.caloriesSum64,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal64,
//                carbohydrates: Constants.Carbohydrates64,
//                fats: Constants.Fats64,
//                proteins: Constants.Proteins64
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName65,
//            dishImageName: Constants.dishImageName65,
//            cookTime: Constants.cookTime65,
//            totalWeight: Constants.caloriesSum65,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal65,
//                carbohydrates: Constants.Carbohydrates65,
//                fats: Constants.Fats65,
//                proteins: Constants.Proteins65
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName66,
//            dishImageName: Constants.dishImageName66,
//            cookTime: Constants.cookTime66,
//            totalWeight: Constants.caloriesSum66,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal66,
//                carbohydrates: Constants.Carbohydrates66,
//                fats: Constants.Fats66,
//                proteins: Constants.Proteins66
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName67,
//            dishImageName: Constants.dishImageName67,
//            cookTime: Constants.cookTime67,
//            totalWeight: Constants.caloriesSum67,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal67,
//                carbohydrates: Constants.Carbohydrates67,
//                fats: Constants.Fats67,
//                proteins: Constants.Proteins67
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName68,
//            dishImageName: Constants.dishImageName68,
//            cookTime: Constants.cookTime68,
//            totalWeight: Constants.caloriesSum68,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal68,
//                carbohydrates: Constants.Carbohydrates68,
//                fats: Constants.Fats68,
//                proteins: Constants.Proteins68
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName69,
//            dishImageName: Constants.dishImageName69,
//            cookTime: Constants.cookTime69,
//            totalWeight: Constants.caloriesSum69,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal69,
//                carbohydrates: Constants.Carbohydrates69,
//                fats: Constants.Fats69,
//                proteins: Constants.Proteins69
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName70,
//            dishImageName: Constants.dishImageName70,
//            cookTime: Constants.cookTime70,
//            totalWeight: Constants.caloriesSum70,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal70,
//                carbohydrates: Constants.Carbohydrates70,
//                fats: Constants.Fats70,
//                proteins: Constants.Proteins70
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName71,
//            dishImageName: Constants.dishImageName71,
//            cookTime: Constants.cookTime71,
//            totalWeight: Constants.caloriesSum71,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal71,
//                carbohydrates: Constants.Carbohydrates71,
//                fats: Constants.Fats71,
//                proteins: Constants.Proteins71
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName72,
//            dishImageName: Constants.dishImageName72,
//            cookTime: Constants.cookTime72,
//            totalWeight: Constants.caloriesSum72,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal72,
//                carbohydrates: Constants.Carbohydrates72,
//                fats: Constants.Fats72,
//                proteins: Constants.Proteins72
//            ),
//            recipe: DishRecipe.recipe
//        )
//    ]
//
//    enum Constants {
//        static let dishName64 = "Fluffy Buttermilk Pancakes"
//        static let dishImageName64 = "pancake1"
//        static let cookTime64 = "20 min"
//        static let caloriesSum64 = "220 g"
//        static let EnercKcal64 = "550 kcal"
//        static let Carbohydrates64 = "75 g"
//        static let Fats64 = "18 g"
//        static let Proteins64 = "15 g"
//
//        static let dishName65 = "Blueberry Pancakes"
//        static let dishImageName65 = "pancake2"
//        static let cookTime65 = "25 min"
//        static let caloriesSum65 = "240 g"
//        static let EnercKcal65 = "600 kcal"
//        static let Carbohydrates65 = "80 g"
//        static let Fats65 = "20 g"
//        static let Proteins65 = "10 g"
//
//        static let dishName66 = "Chocolate Chip Pancakes"
//        static let dishImageName66 = "pancake3"
//        static let cookTime66 = "15 min"
//        static let caloriesSum66 = "260 g"
//        static let EnercKcal66 = "630 kcal"
//        static let Carbohydrates66 = "85 g"
//        static let Fats66 = "22 g"
//        static let Proteins66 = "12 g"
//
//        static let dishName67 = "Banana Nut Pancakes"
//        static let dishImageName67 = "pancake4"
//        static let cookTime67 = "20 min"
//        static let caloriesSum67 = "230 g"
//        static let EnercKcal67 = "580 kcal"
//        static let Carbohydrates67 = "78 g"
//        static let Fats67 = "20 g"
//        static let Proteins67 = "14 g"
//
//        static let dishName68 = "Whole Wheat Pancakes"
//        static let dishImageName68 = "pancake5"
//        static let cookTime68 = "18 min"
//        static let caloriesSum68 = "210 g"
//        static let EnercKcal68 = "490 kcal"
//        static let Carbohydrates68 = "70 g"
//        static let Fats68 = "16 g"
//        static let Proteins68 = "13 g"
//
//        static let dishName69 = "Pumpkin Spice Pancakes"
//        static let dishImageName69 = "pancake6"
//        static let cookTime69 = "25 min"
//        static let caloriesSum69 = "220 g"
//        static let EnercKcal69 = "540 kcal"
//        static let Carbohydrates69 = "75 g"
//        static let Fats69 = "18 g"
//        static let Proteins69 = "11 g"
//
//        static let dishName70 = "Cottage Cheese Pancakes"
//        static let dishImageName70 = "pancake7"
//        static let cookTime70 = "15 min"
//        static let caloriesSum70 = "200 g"
//        static let EnercKcal70 = "350 kcal"
//        static let Carbohydrates70 = "40 g"
//        static let Fats70 = "8 g"
//        static let Proteins70 = "26 g"
//
//        static let dishName71 = "Lemon Ricotta Pancakes"
//        static let dishImageName71 = "pancake8"
//        static let cookTime71 = "20 min"
//        static let caloriesSum71 = "250 g"
//        static let EnercKcal71 = "600 kcal"
//        static let Carbohydrates71 = "82 g"
//        static let Fats71 = "22 g"
//        static let Proteins71 = "18 g"
//
//        static let dishName72 = "Savory Corn Pancakes"
//        static let dishImageName72 = "pancake9"
//        static let cookTime72 = "20 min"
//        static let caloriesSum72 = "230 g"
//        static let EnercKcal72 = "470 kcal"
//        static let Carbohydrates72 = "60 g"
//        static let Fats72 = "14 g"
//        static let Proteins72 = "10 g"
//    }
// }
