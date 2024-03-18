// SideDishes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Источник данных для категории
// struct SideDishDishes {
//    let sideDishDishes = [
//        Dish(
//            dishName: Constants.dishName46,
//            dishImageName: Constants.dishImageName46,
//            cookTime: Constants.cookTime46,
//            totalWeight: Constants.caloriesSum46,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal46,
//                carbohydrates: Constants.Carbohydrates46,
//                fats: Constants.Fats46,
//                proteins: Constants.Proteins46
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName47,
//            dishImageName: Constants.dishImageName47,
//            cookTime: Constants.cookTime47,
//            totalWeight: Constants.caloriesSum47,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal47,
//                carbohydrates: Constants.Carbohydrates47,
//                fats: Constants.Fats47,
//                proteins: Constants.Proteins47
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName48,
//            dishImageName: Constants.dishImageName48,
//            cookTime: Constants.cookTime48,
//            totalWeight: Constants.caloriesSum48,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal48,
//                carbohydrates: Constants.Carbohydrates48,
//                fats: Constants.Fats48,
//                proteins: Constants.Proteins48
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName49,
//            dishImageName: Constants.dishImageName49,
//            cookTime: Constants.cookTime49,
//            totalWeight: Constants.caloriesSum49,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal49,
//                carbohydrates: Constants.Carbohydrates49,
//                fats: Constants.Fats49,
//                proteins: Constants.Proteins49
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName50,
//            dishImageName: Constants.dishImageName50,
//            cookTime: Constants.cookTime50,
//            totalWeight: Constants.caloriesSum50,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal50,
//                carbohydrates: Constants.Carbohydrates50,
//                fats: Constants.Fats50,
//                proteins: Constants.Proteins50
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName51,
//            dishImageName: Constants.dishImageName51,
//            cookTime: Constants.cookTime51,
//            totalWeight: Constants.caloriesSum51,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal51,
//                carbohydrates: Constants.Carbohydrates51,
//                fats: Constants.Fats51,
//                proteins: Constants.Proteins51
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName52,
//            dishImageName: Constants.dishImageName52,
//            cookTime: Constants.cookTime52,
//            totalWeight: Constants.caloriesSum52,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal52,
//                carbohydrates: Constants.Carbohydrates52,
//                fats: Constants.Fats52,
//                proteins: Constants.Proteins52
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName53,
//            dishImageName: Constants.dishImageName53,
//            cookTime: Constants.cookTime53,
//            totalWeight: Constants.caloriesSum53,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal53,
//                carbohydrates: Constants.Carbohydrates53,
//                fats: Constants.Fats53,
//                proteins: Constants.Proteins53
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName54,
//            dishImageName: Constants.dishImageName54,
//            cookTime: Constants.cookTime54,
//            totalWeight: Constants.caloriesSum54,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal54,
//                carbohydrates: Constants.Carbohydrates54,
//                fats: Constants.Fats54,
//                proteins: Constants.Proteins54
//            ),
//            recipe: DishRecipe.recipe
//        )
//    ]
//    enum Constants {
//        static let dishName46 = "Garlic Roasted Potatoes"
//        static let dishImageName46 = "sidedish1"
//        static let cookTime46 = "40 min"
//        static let caloriesSum46 = "200 g"
//        static let EnercKcal46 = "300 kcal"
//        static let Carbohydrates46 = "40 g"
//        static let Fats46 = "10 g"
//        static let Proteins46 = "5 g"
//
//        static let dishName47 = "Creamed Spinach"
//        static let dishImageName47 = "sidedish2"
//        static let cookTime47 = "20 min"
//        static let caloriesSum47 = "150 g"
//        static let EnercKcal47 = "250 kcal"
//        static let Carbohydrates47 = "10 g"
//        static let Fats47 = "18 g"
//        static let Proteins47 = "7 g"
//
//        static let dishName48 = "Honey Glazed Carrots"
//        static let dishImageName48 = "sidedish3"
//        static let cookTime48 = "25 min"
//        static let caloriesSum48 = "130 g"
//        static let EnercKcal48 = "210 kcal"
//        static let Carbohydrates48 = "30 g"
//        static let Fats48 = "5 g"
//        static let Proteins48 = "1 g"
//
//        static let dishName49 = "Balsamic Roasted Brussels Sprouts"
//        static let dishImageName49 = "sidedish4"
//        static let cookTime49 = "35 min"
//        static let caloriesSum49 = "160 g"
//        static let EnercKcal49 = "220 kcal"
//        static let Carbohydrates49 = "20 g"
//        static let Fats49 = "10 g"
//        static let Proteins49 = "6 g"
//
//        static let dishName50 = "Cheesy Cauliflower Gratin"
//        static let dishImageName50 = "sidedish5"
//        static let cookTime50 = "45 min"
//        static let caloriesSum50 = "250 g"
//        static let EnercKcal50 = "400 kcal"
//        static let Carbohydrates50 = "15 g"
//        static let Fats50 = "30 g"
//        static let Proteins50 = "15 g"
//
//        static let dishName51 = "Mashed Sweet Potatoes"
//        static let dishImageName51 = "sidedish6"
//        static let cookTime51 = "30 min"
//        static let caloriesSum51 = "210 g"
//        static let EnercKcal51 = "350 kcal"
//        static let Carbohydrates51 = "45 g"
//        static let Fats51 = "10 g"
//        static let Proteins51 = "4 g"
//
//        static let dishName52 = "Quinoa Salad with Vegetables"
//        static let dishImageName52 = "sidedish7"
//        static let cookTime52 = "20 min"
//        static let caloriesSum52 = "180 g"
//        static let EnercKcal52 = "310 kcal"
//        static let Carbohydrates52 = "50 g"
//        static let Fats52 = "7 g"
//        static let Proteins52 = "8 g"
//
//        static let dishName53 = "Sautéed Green Beans with Garlic"
//        static let dishImageName53 = "sidedish8"
//        static let cookTime53 = "15 min"
//        static let caloriesSum53 = "120 g"
//        static let EnercKcal53 = "180 kcal"
//        static let Carbohydrates53 = "10 g"
//        static let Fats53 = "12 g"
//        static let Proteins53 = "2 g"
//
//        static let dishName54 = "Cucumber Tomato Salad"
//        static let dishImageName54 = "sidedish9"
//        static let cookTime54 = "10 min"
//        static let caloriesSum54 = "100 g"
//        static let EnercKcal54 = "70 kcal"
//        static let Carbohydrates54 = "16 g"
//        static let Fats54 = "0.5 g"
//        static let Proteins54 = "2 g"
//    }
// }
