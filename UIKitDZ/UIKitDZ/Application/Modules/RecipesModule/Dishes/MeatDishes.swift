// MeatDishes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Источник данных для категории
// struct MeatDishes {
//    let meatDishes = [
//        Dish(
//            dishName: Constants.dishName28,
//            dishImageName: Constants.dishImageName28,
//            cookTime: Constants.cookTime28,
//            totalWeight: Constants.caloriesSum28,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal28,
//                carbohydrates: Constants.Carbohydrates28,
//                fats: Constants.Fats28,
//                proteins: Constants.Proteins28
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName29,
//            dishImageName: Constants.dishImageName29,
//            cookTime: Constants.cookTime29,
//            totalWeight: Constants.caloriesSum29,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal29,
//                carbohydrates: Constants.Carbohydrates29,
//                fats: Constants.Fats29,
//                proteins: Constants.Proteins29
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName30,
//            dishImageName: Constants.dishImageName30,
//            cookTime: Constants.cookTime30,
//            totalWeight: Constants.caloriesSum30,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal30,
//                carbohydrates: Constants.Carbohydrates30,
//                fats: Constants.Fats30,
//                proteins: Constants.Proteins30
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName31,
//            dishImageName: Constants.dishImageName31,
//            cookTime: Constants.cookTime31,
//            totalWeight: Constants.caloriesSum31,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal31,
//                carbohydrates: Constants.Carbohydrates31,
//                fats: Constants.Fats31,
//                proteins: Constants.Proteins31
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName32,
//            dishImageName: Constants.dishImageName32,
//            cookTime: Constants.cookTime32,
//            totalWeight: Constants.caloriesSum32,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal32,
//                carbohydrates: Constants.Carbohydrates32,
//                fats: Constants.Fats32,
//                proteins: Constants.Proteins32
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName33,
//            dishImageName: Constants.dishImageName33,
//            cookTime: Constants.cookTime33,
//            totalWeight: Constants.caloriesSum33,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal33,
//                carbohydrates: Constants.Carbohydrates33,
//                fats: Constants.Fats33,
//                proteins: Constants.Proteins33
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName34,
//            dishImageName: Constants.dishImageName34,
//            cookTime: Constants.cookTime34,
//            totalWeight: Constants.caloriesSum34,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal34,
//                carbohydrates: Constants.Carbohydrates34,
//                fats: Constants.Fats34,
//                proteins: Constants.Proteins34
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName35,
//            dishImageName: Constants.dishImageName35,
//            cookTime: Constants.cookTime35,
//            totalWeight: Constants.caloriesSum35,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal35,
//                carbohydrates: Constants.Carbohydrates35,
//                fats: Constants.Fats35,
//                proteins: Constants.Proteins35
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName36,
//            dishImageName: Constants.dishImageName36,
//            cookTime: Constants.cookTime36,
//            totalWeight: Constants.caloriesSum36,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal36,
//                carbohydrates: Constants.Carbohydrates36,
//                fats: Constants.Fats36,
//                proteins: Constants.Proteins36
//            ),
//            recipe: DishRecipe.recipe
//        )
//    ]
//
//    enum Constants {
//        static let dishName28 = "Classic Beef Bourguignon"
//        static let dishImageName28 = "meat1"
//        static let cookTime28 = "180 min"
//        static let caloriesSum28 = "400 g"
//        static let EnercKcal28 = "620 kcal"
//        static let Carbohydrates28 = "9 g"
//        static let Fats28 = "30 g"
//        static let Proteins28 = "70 g"
//
//        static let dishName29 = "Slow-Cooked Lamb Shoulder"
//        static let dishImageName29 = "meat2"
//        static let cookTime29 = "240 min"
//        static let caloriesSum29 = "450 g"
//        static let EnercKcal29 = "750 kcal"
//        static let Carbohydrates29 = "0 g"
//        static let Fats29 = "50 g"
//        static let Proteins29 = "65 g"
//
//        static let dishName30 = "Pulled Pork Sandwich"
//        static let dishImageName30 = "meat3"
//        static let cookTime30 = "360 min"
//        static let caloriesSum30 = "300 g"
//        static let EnercKcal30 = "690 kcal"
//        static let Carbohydrates30 = "35 g"
//        static let Fats30 = "40 g"
//        static let Proteins30 = "30 g"
//
//        static let dishName31 = "Grilled Ribeye Steak"
//        static let dishImageName31 = "meat4"
//        static let cookTime31 = "20 min"
//        static let caloriesSum31 = "500 g"
//        static let EnercKcal31 = "900 kcal"
//        static let Carbohydrates31 = "0 g"
//        static let Fats31 = "70 g"
//        static let Proteins31 = "80 g"
//
//        static let dishName32 = "Spicy Italian Sausage Pasta"
//        static let dishImageName32 = "meat5"
//        static let cookTime32 = "30 min"
//        static let caloriesSum32 = "350 g"
//        static let EnercKcal32 = "800 kcal"
//        static let Carbohydrates32 = "45 g"
//        static let Fats32 = "45 g"
//        static let Proteins32 = "25 g"
//
//        static let dishName33 = "Maple-Glazed Ham"
//        static let dishImageName33 = "meat6"
//        static let cookTime33 = "120 min"
//        static let caloriesSum33 = "600 g"
//        static let EnercKcal33 = "980 kcal"
//        static let Carbohydrates33 = "60 g"
//        static let Fats33 = "35 g"
//        static let Proteins33 = "55 g"
//
//        static let dishName34 = "Beef Stroganoff"
//        static let dishImageName34 = "meat7"
//        static let cookTime34 = "60 min"
//        static let caloriesSum34 = "420 g"
//        static let EnercKcal34 = "720 kcal"
//        static let Carbohydrates34 = "50 g"
//        static let Fats34 = "30 g"
//        static let Proteins34 = "40 g"
//
//        static let dishName35 = "Mongolian Beef"
//        static let dishImageName35 = "meat8"
//        static let cookTime35 = "25 min"
//        static let caloriesSum35 = "370 g"
//        static let EnercKcal35 = "645 kcal"
//        static let Carbohydrates35 = "55 g"
//        static let Fats35 = "25 g"
//        static let Proteins35 = "35 g"
//
//        static let dishName36 = "Roast Turkey with Gravy"
//        static let dishImageName36 = "meat9"
//        static let cookTime36 = "240 min"
//        static let caloriesSum36 = "650 g"
//        static let EnercKcal36 = "1100 kcal"
//        static let Carbohydrates36 = "10 g"
//        static let Fats36 = "50 g"
//        static let Proteins36 = "100 g"
//    }
// }
