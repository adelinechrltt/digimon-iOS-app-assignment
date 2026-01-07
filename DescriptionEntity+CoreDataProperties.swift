//
//  DescriptionEntity+CoreDataProperties.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//
//

import Foundation
import CoreData


extension DescriptionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DescriptionEntity> {
        return NSFetchRequest<DescriptionEntity>(entityName: "DescriptionEntity")
    }

    @NSManaged public var language: String?
    @NSManaged public var desc: String?
    @NSManaged public var origin: String?
    @NSManaged public var digimon: DigimonEntity?

}

extension DescriptionEntity : Identifiable {

}
