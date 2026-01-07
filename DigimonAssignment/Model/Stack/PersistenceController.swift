//
//  PersistenceController.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//

import Foundation
import CoreData

final class PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer

    var viewContext: NSManagedObjectContext {
        container.viewContext
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "DigimonAssignmentModels")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
    }
}
