// CoreDataService.swift
// Copyright © RoadMap. All rights reserved.

import CoreData
import Foundation

protocol CoreDataServiceProtocol {
    func create(dishes: [Dish], by category: String)
    func create(dishDetail: DishDetail)
    func fetchDishes(by category: String) -> [Dish]
    func fetchDishDetail(by uri: String) -> DishDetail?
}

final class CoreDataService {
    static let shared = CoreDataService()

    private init() {}

    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores { description, error in
            if let error {
                print(error.localizedDescription)
            } else {
                print("DB url -", description.url?.absoluteString ?? "")
            }
        }
        return container
    }()

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}

extension CoreDataService: CoreDataServiceProtocol {
    func create(dishes: [Dish], by category: String) {
        guard let dishEntityDescription = NSEntityDescription.entity(forEntityName: "CoreDataDish", in: context)
        else { return }
        for dish in dishes {
            let CDdish = CoreDataDish(entity: dishEntityDescription, insertInto: context)
            CDdish.category = category
            CDdish.cookTime = dish.cookTime
            CDdish.totalWeight = dish.totalWeight
            CDdish.dishImageName = dish.dishImageName
            CDdish.dishName = dish.dishName
            CDdish.uri = dish.uri

            saveContext()
        }
    }

    func create(dishDetail: DishDetail) {
        guard let dishDetailDescription = NSEntityDescription.entity(forEntityName: "CoreDataDishDetail", in: context)
        else { return }
        let CDdishDetail = CoreDataDishDetail(entity: dishDetailDescription, insertInto: context)
        CDdishDetail.label = dishDetail.label
        CDdishDetail.totalTime = Int16(dishDetail.totalTime)
        CDdishDetail.totalWeight = dishDetail.totalWeight
        CDdishDetail.calories = Double(dishDetail.calories)
        CDdishDetail.fats = dishDetail.fats
        CDdishDetail.proteins = dishDetail.proteins
        CDdishDetail.chocdf = dishDetail.chocdf
        CDdishDetail.images = dishDetail.images
        CDdishDetail.ingredientLines = dishDetail.ingridientLines
        saveContext()
    }

    func fetchDishes(by category: String) -> [Dish] {
        let dishFetchRequest = CoreDataDish.fetchRequest()
        do {
            let allCategoriesDishes = try? context.fetch(dishFetchRequest)
            guard let neededCategoryDishes = allCategoriesDishes?.filter({ $0.category == category }) else {
                return []
            }
            return neededCategoryDishes.map { Dish(CDdish: $0) }
        }
    }

    func fetchDishDetail(by dishName: String) -> DishDetail? {
        let dishDetailfetchRequest = CoreDataDishDetail.fetchRequest()
        do {
            let result = try? context.fetch(dishDetailfetchRequest)
            guard let neededDishDetail = result?.filter({ $0.label == dishName }).first else {
                return nil
            }
            return DishDetail(CDdishDetail: neededDishDetail)
        }
    }
}
