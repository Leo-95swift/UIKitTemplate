// DessertDishes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Источник данных для категории
// struct DessertDishes {
//    let dessertDishes = [
//        Dish(
//            dishName: Constants.dishName73,
//            dishImageName: Constants.dishImageName73,
//            cookTime: Constants.cookTime73,
//            totalWeight: Constants.caloriesSum73,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal73,
//                carbohydrates: Constants.Carbohydrates73,
//                fats: Constants.Fats73,
//                proteins: Constants.Proteins73
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName74,
//            dishImageName: Constants.dishImageName74,
//            cookTime: Constants.cookTime74,
//            totalWeight: Constants.caloriesSum74,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal74,
//                carbohydrates: Constants.Carbohydrates74,
//                fats: Constants.Fats74,
//                proteins: Constants.Proteins74
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName75,
//            dishImageName: Constants.dishImageName75,
//            cookTime: Constants.cookTime75,
//            totalWeight: Constants.caloriesSum75,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal75,
//                carbohydrates: Constants.Carbohydrates75,
//                fats: Constants.Fats75,
//                proteins: Constants.Proteins75
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName76,
//            dishImageName: Constants.dishImageName76,
//            cookTime: Constants.cookTime76,
//            totalWeight: Constants.caloriesSum76,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal76,
//                carbohydrates: Constants.Carbohydrates76,
//                fats: Constants.Fats76,
//                proteins: Constants.Proteins76
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName77,
//            dishImageName: Constants.dishImageName77,
//            cookTime: Constants.cookTime77,
//            totalWeight: Constants.caloriesSum77,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal77,
//                carbohydrates: Constants.Carbohydrates77,
//                fats: Constants.Fats77,
//                proteins: Constants.Proteins77
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName78,
//            dishImageName: Constants.dishImageName78,
//            cookTime: Constants.cookTime78,
//            totalWeight: Constants.caloriesSum78,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal78,
//                carbohydrates: Constants.Carbohydrates78,
//                fats: Constants.Fats78,
//                proteins: Constants.Proteins78
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName79,
//            dishImageName: Constants.dishImageName79,
//            cookTime: Constants.cookTime79,
//            totalWeight: Constants.caloriesSum79,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal79,
//                carbohydrates: Constants.Carbohydrates79,
//                fats: Constants.Fats79,
//                proteins: Constants.Proteins79
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName80,
//            dishImageName: Constants.dishImageName80,
//            cookTime: Constants.cookTime80,
//            totalWeight: Constants.caloriesSum80,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal80,
//                carbohydrates: Constants.Carbohydrates80,
//                fats: Constants.Fats80,
//                proteins: Constants.Proteins80
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName81,
//            dishImageName: Constants.dishImageName81,
//            cookTime: Constants.cookTime81,
//            totalWeight: Constants.caloriesSum81,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal81,
//                carbohydrates: Constants.Carbohydrates81,
//                fats: Constants.Fats81,
//                proteins: Constants.Proteins81
//            ),
//            recipe: DishRecipe.recipe
//        )
//    ]
//
//    enum Constants {
//        static let dishName73 = "Classic New York Cheesecake"
//        static let dishImageName73 = "dessert1"
//        static let cookTime73 = "120 min"
//        static let caloriesSum73 = "250 g"
//        static let EnercKcal73 = "710 kcal"
//        static let Carbohydrates73 = "55 g"
//        static let Fats73 = "48 g"
//        static let Proteins73 = "9 g"
//
//        static let dishName74 = "Rich Chocolate Mousse"
//        static let dishImageName74 = "dessert2"
//        static let cookTime74 = "30 min"
//        static let caloriesSum74 = "150 g"
//        static let EnercKcal74 = "550 kcal"
//        static let Carbohydrates74 = "35 g"
//        static let Fats74 = "45 g"
//        static let Proteins74 = "5 g"
//
//        static let dishName75 = "Apple Crumble Pie"
//        static let dishImageName75 = "dessert3"
//        static let cookTime75 = "60 min"
//        static let caloriesSum75 = "200 g"
//        static let EnercKcal75 = "480 kcal"
//        static let Carbohydrates75 = "65 g"
//        static let Fats75 = "20 g"
//        static let Proteins75 = "3 g"
//
//        static let dishName76 = "Tiramisu"
//        static let dishImageName76 = "dessert4"
//        static let cookTime76 = "240 min"
//        static let caloriesSum76 = "220 g"
//        static let EnercKcal76 = "350 kcal"
//        static let Carbohydrates76 = "40 g"
//        static let Fats76 = "15 g"
//        static let Proteins76 = "5 g"
//
//        static let dishName77 = "Lemon Meringue Pie"
//        static let dishImageName77 = "dessert5"
//        static let cookTime77 = "90 min"
//        static let caloriesSum77 = "180 g"
//        static let EnercKcal77 = "400 kcal"
//        static let Carbohydrates77 = "50 g"
//        static let Fats77 = "20 g"
//        static let Proteins77 = "6 g"
//
//        static let dishName78 = "Raspberry Sorbet"
//        static let dishImageName78 = "dessert6"
//        static let cookTime78 = "0 min"
//        static let caloriesSum78 = "100 g"
//        static let EnercKcal78 = "145 kcal"
//        static let Carbohydrates78 = "35 g"
//        static let Fats78 = "0 g"
//        static let Proteins78 = "1 g"
//
//        static let dishName79 = "Pecan Pie"
//        static let dishImageName79 = "dessert7"
//        static let cookTime79 = "60 min"
//        static let caloriesSum79 = "260 g"
//        static let EnercKcal79 = "510 kcal"
//        static let Carbohydrates79 = "65 g"
//        static let Fats79 = "27 g"
//        static let Proteins79 = "6 g"
//
//        static let dishName80 = "Baked Alaska"
//        static let dishImageName80 = "dessert8"
//        static let cookTime80 = "300 min"
//        static let caloriesSum80 = "190 g"
//        static let EnercKcal80 = "430 kcal"
//        static let Carbohydrates80 = "34 g"
//        static let Fats80 = "28 g"
//        static let Proteins80 = "7 g"
//
//        static let dishName81 = "French Macarons"
//        static let dishImageName81 = "dessert9"
//        static let cookTime81 = "45 min"
//        static let caloriesSum81 = "50 g"
//        static let EnercKcal81 = "270 kcal"
//        static let Carbohydrates81 = "30 g"
//        static let Fats81 = "14 g"
//        static let Proteins81 = "5 g"
//   }
// }
