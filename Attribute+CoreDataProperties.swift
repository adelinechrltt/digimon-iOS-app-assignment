//
//  Attribute+CoreDataProperties.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//
//

import Foundation
import CoreData


extension Attribute {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Attribute> {
        return NSFetchRequest<Attribute>(entityName: "Attribute")
    }

    @NSManaged public var id: Int64
    @NSManaged public var attribute: String?
    @NSManaged public var digimons: NSSet?

}

// MARK: Generated accessors for digimons
extension Attribute {

    @objc(addDigimonsObject:)
    @NSManaged public func addToDigimons(_ value: Digimon)

    @objc(removeDigimonsObject:)
    @NSManaged public func removeFromDigimons(_ value: Digimon)

    @objc(addDigimons:)
    @NSManaged public func addToDigimons(_ values: NSSet)

    @objc(removeDigimons:)
    @NSManaged public func removeFromDigimons(_ values: NSSet)

}

extension Attribute : Identifiable {

}
