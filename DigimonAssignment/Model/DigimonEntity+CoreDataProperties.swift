//
//  DigimonEntity+CoreDataProperties.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//
//

import Foundation
import CoreData


extension DigimonEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DigimonEntity> {
        return NSFetchRequest<DigimonEntity>(entityName: "DigimonEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var xAntibody: Bool
    @NSManaged public var releaseDate: String?
    @NSManaged public var image: NSObject?
    @NSManaged public var imageTransparent: NSObject?
    @NSManaged public var level: NSObject?
    @NSManaged public var type: NSObject?
    @NSManaged public var attribute: String?
    @NSManaged public var field: NSObject?
    @NSManaged public var fieldImage: NSObject?
    @NSManaged public var descriptions: NSSet?

}

// MARK: Generated accessors for descriptions
extension DigimonEntity {

    @objc(addDescriptionsObject:)
    @NSManaged public func addToDescriptions(_ value: DescriptionEntity)

    @objc(removeDescriptionsObject:)
    @NSManaged public func removeFromDescriptions(_ value: DescriptionEntity)

    @objc(addDescriptions:)
    @NSManaged public func addToDescriptions(_ values: NSSet)

    @objc(removeDescriptions:)
    @NSManaged public func removeFromDescriptions(_ values: NSSet)

}

extension DigimonEntity : Identifiable {

}
