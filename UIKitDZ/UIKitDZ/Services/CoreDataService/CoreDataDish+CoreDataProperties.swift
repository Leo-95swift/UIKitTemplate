// CoreDataDish+CoreDataProperties.swift
// Copyright © RoadMap. All rights reserved.

import CoreData
import Foundation

@objc(CoreDataDish)
public class CoreDataDish: NSManagedObject {}

/// Расширение для модели блюда
public extension CoreDataDish {
    @nonobjc class func fetchRequest() -> NSFetchRequest<CoreDataDish> {
        NSFetchRequest<CoreDataDish>(entityName: "CoreDataDish")
    }

    @NSManaged var category: String
    @NSManaged var dishName: String
    @NSManaged var cookTime: Double
    @NSManaged var totalWeight: Double
    @NSManaged var uri: String
    @NSManaged var dishImageName: String
}

extension CoreDataDish: Identifiable {}
