//
//  DigimonAssignmentApp.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 06/01/26.
//

import SwiftUI

@main
struct DigimonAssignmentApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                                              persistenceController.viewContext)
        }
    }
}
