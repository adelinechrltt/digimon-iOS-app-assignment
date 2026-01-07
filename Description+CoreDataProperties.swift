//
//  Description+CoreDataProperties.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//
//

import Foundation
import CoreData


extension Description {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Description> {
        return NSFetchRequest<Description>(entityName: "Description")
    }

    @NSManaged public var language: String?
    @NSManaged public var desc: String?
    @NSManaged public var origin: String?
    @NSManaged public var digimon: Digimon?

}

extension Description : Identifiable {

}
