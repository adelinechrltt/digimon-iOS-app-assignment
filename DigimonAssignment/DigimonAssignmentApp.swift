//
//  DigimonAssignmentApp.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 06/01/26.
//

import SwiftUI
import SwiftData

@main
struct DigimonAssignmentApp: App {
    var body: some Scene {
        WindowGroup {
            let container = try! ModelContainer(for: Digimon.self)

            DigimonListView(modelContext: container.mainContext)
                .modelContainer(for: Digimon.self)
        }
    }
}
