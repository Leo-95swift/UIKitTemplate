// SoupDishes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Источник данных для категории
// struct SoupDishes {
//    let soupDishes = [
//        Dish(
//            dishName: Constants.dishName10,
//            dishImageName: Constants.dishImageName10,
//            cookTime: Constants.cookTime10,
//            totalWeight: Constants.caloriesSum10,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal10,
//                carbohydrates: Constants.Carbohydrates10,
//                fats: Constants.Fats10,
//                proteins: Constants.Proteins10
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName11,
//            dishImageName: Constants.dishImageName11,
//            cookTime: Constants.cookTime11,
//            totalWeight: Constants.caloriesSum11,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal11,
//                carbohydrates: Constants.Carbohydrates11,
//                fats: Constants.Fats11,
//                proteins: Constants.Proteins11
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName12,
//            dishImageName: Constants.dishImageName12,
//            cookTime: Constants.cookTime12,
//            totalWeight: Constants.caloriesSum12,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal12,
//                carbohydrates: Constants.Carbohydrates12,
//                fats: Constants.Fats12,
//                proteins: Constants.Proteins12
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName13,
//            dishImageName: Constants.dishImageName13,
//            cookTime: Constants.cookTime13,
//            totalWeight: Constants.caloriesSum13,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal13,
//                carbohydrates: Constants.Carbohydrates13,
//                fats: Constants.Fats13,
//                proteins: Constants.Proteins13
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName14,
//            dishImageName: Constants.dishImageName14,
//            cookTime: Constants.cookTime14,
//            totalWeight: Constants.caloriesSum14,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal14,
//                carbohydrates: Constants.Carbohydrates14,
//                fats: Constants.Fats14,
//                proteins: Constants.Proteins14
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName15,
//            dishImageName: Constants.dishImageName15,
//            cookTime: Constants.cookTime15,
//            totalWeight: Constants.caloriesSum15,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal15,
//                carbohydrates: Constants.Carbohydrates15,
//                fats: Constants.Fats15,
//                proteins: Constants.Proteins15
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName16,
//            dishImageName: Constants.dishImageName16,
//            cookTime: Constants.cookTime16,
//            totalWeight: Constants.caloriesSum16,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal16,
//                carbohydrates: Constants.Carbohydrates16,
//                fats: Constants.Fats16,
//                proteins: Constants.Proteins16
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName17,
//            dishImageName: Constants.dishImageName17,
//            cookTime: Constants.cookTime17,
//            totalWeight: Constants.caloriesSum17,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal17,
//                carbohydrates: Constants.Carbohydrates17,
//                fats: Constants.Fats17,
//                proteins: Constants.Proteins17
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName18,
//            dishImageName: Constants.dishImageName18,
//            cookTime: Constants.cookTime18,
//            totalWeight: Constants.caloriesSum18,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal18,
//                carbohydrates: Constants.Carbohydrates18,
//                fats: Constants.Fats18,
//                proteins: Constants.Proteins18
//            ),
//            recipe: DishRecipe.recipe
//        )
//    ]
//
//    enum Constants {
//        static let dishName10 = "Creamy Tomato Basil Soup"
//        static let dishImageName10 = "soup1"
//        static let cookTime10 = "45 min"
//        static let caloriesSum10 = "250 g"
//        static let EnercKcal10 = "345 kcal"
//        static let Carbohydrates10 = "16.50 g"
//        static let Fats10 = "25.70 g"
//        static let Proteins10 = "3.85 g"
//
//        static let dishName11 = "Hearty Beef Stew"
//        static let dishImageName11 = "soup2"
//        static let cookTime11 = "120 min"
//        static let caloriesSum11 = "350 g"
//        static let EnercKcal11 = "410 kcal"
//        static let Carbohydrates11 = "18.00 g"
//        static let Fats11 = "22.00 g"
//        static let Proteins11 = "26.00 g"
//
//        static let dishName12 = "Spicy Chicken Noodle Soup"
//        static let dishImageName12 = "soup3"
//        static let cookTime12 = "60 min"
//        static let caloriesSum12 = "300 g"
//        static let EnercKcal12 = "237 kcal"
//        static let Carbohydrates12 = "24.00 g"
//        static let Fats12 = "3.50 g"
//        static let Proteins12 = "18.75 g"
//
//        static let dishName13 = "Classic French Onion Soup"
//        static let dishImageName13 = "soup4"
//        static let cookTime13 = "90 min"
//        static let caloriesSum13 = "200 g"
//        static let EnercKcal13 = "224 kcal"
//        static let Carbohydrates13 = "9.34 g"
//        static let Fats13 = "12.68 g"
//        static let Proteins13 = "8.90 g"
//
//        static let dishName14 = "Creamy Asparagus Soup"
//        static let dishImageName14 = "soup5"
//        static let cookTime14 = "45 min"
//        static let caloriesSum14 = "230 g"
//        static let EnercKcal14 = "148 kcal"
//        static let Carbohydrates14 = "7.82 g"
//        static let Fats14 = "10.00 g"
//        static let Proteins14 = "3.22 g"
//
//        static let dishName15 = "Butternut Squash Soup"
//        static let dishImageName15 = "soup6"
//        static let cookTime15 = "55 min"
//        static let caloriesSum15 = "275 g"
//        static let EnercKcal15 = "193 kcal"
//        static let Carbohydrates15 = "25.00 g"
//        static let Fats15 = "5.67 g"
//        static let Proteins15 = "2.90 g"
//
//        static let dishName16 = "Chunky Lentil and Vegetable Soup"
//        static let dishImageName16 = "soup7"
//        static let cookTime16 = "70 min"
//        static let caloriesSum16 = "330 g"
//        static let EnercKcal16 = "289 kcal"
//        static let Carbohydrates16 = "54.00 g"
//        static let Fats16 = "2.00 g"
//        static let Proteins16 = "18.00 g"
//
//        static let dishName17 = "Spicy Thai Coconut Soup"
//        static let dishImageName17 = "soup8"
//        static let cookTime17 = "50 min"
//        static let caloriesSum17 = "240 g"
//        static let EnercKcal17 = "312 kcal"
//        static let Carbohydrates17 = "12.00 g"
//        static let Fats17 = "22.00 g"
//        static let Proteins17 = "8.00 g"
//
//        static let dishName18 = "Mushroom Barley Soup"
//        static let dishImageName18 = "soup9"
//        static let cookTime18 = "80 min"
//        static let caloriesSum18 = "215 g"
//        static let EnercKcal18 = "165 kcal"
//        static let Carbohydrates18 = "27.50 g"
//        static let Fats18 = "1.75 g"
//        static let Proteins18 = "4.50 g"
//    }
// }
