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
    let container: ModelContainer

    init() {
        do {
            container = try ModelContainer(for: Digimon.self)
        } catch {
            fatalError("Failed to initialize ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            DigimonListView(modelContext: container.mainContext)
                .modelContainer(container)
        }
    }
}
