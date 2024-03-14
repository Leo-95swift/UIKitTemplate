// FishDishes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Источник данных для категории
// struct FishDishes {
//    let fishDishes = [
//        Dish(
//            dishName: Constants.dishName37,
//            dishImageName: Constants.dishImageName37,
//            cookTime: Constants.cookTime37,
//            totalWeight: Constants.caloriesSum37,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal37,
//                carbohydrates: Constants.Carbohydrates37,
//                fats: Constants.Fats37,
//                proteins: Constants.Proteins37
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName38,
//            dishImageName: Constants.dishImageName38,
//            cookTime: Constants.cookTime38,
//            totalWeight: Constants.caloriesSum38,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal38,
//                carbohydrates: Constants.Carbohydrates38,
//                fats: Constants.Fats38,
//                proteins: Constants.Proteins38
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName39,
//            dishImageName: Constants.dishImageName39,
//            cookTime: Constants.cookTime39,
//            totalWeight: Constants.caloriesSum39,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal39,
//                carbohydrates: Constants.Carbohydrates39,
//                fats: Constants.Fats39,
//                proteins: Constants.Proteins39
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName40,
//            dishImageName: Constants.dishImageName40,
//            cookTime: Constants.cookTime40,
//            totalWeight: Constants.caloriesSum40,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal40,
//                carbohydrates: Constants.Carbohydrates40,
//                fats: Constants.Fats40,
//                proteins: Constants.Proteins40
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName41,
//            dishImageName: Constants.dishImageName41,
//            cookTime: Constants.cookTime41,
//            totalWeight: Constants.caloriesSum41,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal41,
//                carbohydrates: Constants.Carbohydrates41,
//                fats: Constants.Fats41,
//                proteins: Constants.Proteins41
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName42,
//            dishImageName: Constants.dishImageName42,
//            cookTime: Constants.cookTime42,
//            totalWeight: Constants.caloriesSum42,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal42,
//                carbohydrates: Constants.Carbohydrates42,
//                fats: Constants.Fats42,
//                proteins: Constants.Proteins42
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName43,
//            dishImageName: Constants.dishImageName43,
//            cookTime: Constants.cookTime43,
//            totalWeight: Constants.caloriesSum43,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal43,
//                carbohydrates: Constants.Carbohydrates43,
//                fats: Constants.Fats43,
//                proteins: Constants.Proteins43
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName44,
//            dishImageName: Constants.dishImageName44,
//            cookTime: Constants.cookTime44,
//            totalWeight: Constants.caloriesSum44,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal44,
//                carbohydrates: Constants.Carbohydrates44,
//                fats: Constants.Fats44,
//                proteins: Constants.Proteins44
//            ),
//            recipe: DishRecipe.recipe
//        ),
//        Dish(
//            dishName: Constants.dishName45,
//            dishImageName: Constants.dishImageName45,
//            cookTime: Constants.cookTime45,
//            totalWeight: Constants.caloriesSum45,
//            nutrients: Nutrients(
//                enercKcal: Constants.EnercKcal45,
//                carbohydrates: Constants.Carbohydrates45,
//                fats: Constants.Fats45,
//                proteins: Constants.Proteins45
//            ),
//            recipe: DishRecipe.recipe
//        )
//    ]
//    enum Constants {
//        static let dishName37 = "Pan-Seared Salmon with Dill Sauce"
//        static let dishImageName37 = "fish1"
//        static let cookTime37 = "20 min"
//        static let caloriesSum37 = "350 g"
//        static let EnercKcal37 = "500 kcal"
//        static let Carbohydrates37 = "2 g"
//        static let Fats37 = "28 g"
//        static let Proteins37 = "50 g"
//
//        static let dishName38 = "Grilled Tuna Steaks with Mango Salsa"
//        static let dishImageName38 = "fish2"
//        static let cookTime38 = "15 min"
//        static let caloriesSum38 = "300 g"
//        static let EnercKcal38 = "420 kcal"
//        static let Carbohydrates38 = "30 g"
//        static let Fats38 = "10 g"
//        static let Proteins38 = "40 g"
//
//        static let dishName39 = "Baked Cod with Lemon Butter"
//        static let dishImageName39 = "fish3"
//        static let cookTime39 = "25 min"
//        static let caloriesSum39 = "280 g"
//        static let EnercKcal39 = "370 kcal"
//        static let Carbohydrates39 = "1 g"
//        static let Fats39 = "20 g"
//        static let Proteins39 = "35 g"
//
//        static let dishName40 = "Cajun Spice Grilled Catfish"
//        static let dishImageName40 = "fish4"
//        static let cookTime40 = "10 min"
//        static let caloriesSum40 = "320 g"
//        static let EnercKcal40 = "440 kcal"
//        static let Carbohydrates40 = "0 g"
//        static let Fats40 = "22 g"
//        static let Proteins40 = "48 g"
//
//        static let dishName41 = "Lemon Herb Poached Haddock"
//        static let dishImageName41 = "fish5"
//        static let cookTime41 = "30 min"
//        static let caloriesSum41 = "260 g"
//        static let EnercKcal41 = "290 kcal"
//        static let Carbohydrates41 = "0 g"
//        static let Fats41 = "12 g"
//        static let Proteins41 = "40 g"
//
//        static let dishName42 = "Spicy Shrimp Tacos"
//        static let dishImageName42 = "fish6"
//        static let cookTime42 = "20 min"
//        static let caloriesSum42 = "310 g"
//        static let EnercKcal42 = "460 kcal"
//        static let Carbohydrates42 = "35 g"
//        static let Fats42 = "20 g"
//        static let Proteins42 = "25 g"
//
//        static let dishName43 = "Soy-Glazed Salmon with Ginger"
//        static let dishImageName43 = "fish7"
//        static let cookTime43 = "22 min"
//        static let caloriesSum43 = "330 g"
//        static let EnercKcal43 = "510 kcal"
//        static let Carbohydrates43 = "10 g"
//        static let Fats43 = "30 g"
//        static let Proteins43 = "40 g"
//
//        static let dishName44 = "Fried Catfish with Tartar Sauce"
//        static let dishImageName44 = "fish8"
//        static let cookTime44 = "18 min"
//        static let caloriesSum44 = "360 g"
//        static let EnercKcal44 = "590 kcal"
//        static let Carbohydrates44 = "48 g"
//        static let Fats44 = "28 g"
//        static let Proteins44 = "22 g"
//
//        static let dishName45 = "Seafood Paella"
//        static let dishImageName45 = "fish9"
//        static let cookTime45 = "60 min"
//        static let caloriesSum45 = "400 g"
//        static let EnercKcal45 = "700 kcal"
//        static let Carbohydrates45 = "80 g"
//        static let Fats45 = "20 g"
//        static let Proteins45 = "30 g"
//    }
// }
