// CoreDataDishDetail+CoreDataProperties.swift
// Copyright © RoadMap. All rights reserved.

import CoreData
import Foundation

@objc(CoreDataDishDetail)
public class CoreDataDishDetail: NSManagedObject {}

/// Расширение для модели детального блюда
public extension CoreDataDishDetail {
    @nonobjc class func fetchRequest() -> NSFetchRequest<CoreDataDishDetail> {
        NSFetchRequest<CoreDataDishDetail>(entityName: "CoreDataDishDetail")
    }

    @NSManaged var calories: Double
    @NSManaged var fats: Double
    @NSManaged var proteins: Double
    @NSManaged var totalTime: Int16
    @NSManaged var chocdf: Double
    @NSManaged var totalWeight: Double
    @NSManaged var label: String
    @NSManaged var ingredientLines: String
    @NSManaged var images: String?
}

extension CoreDataDishDetail: Identifiable {}
