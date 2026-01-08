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
            ContentView()
                .modelContainer(for: Digimon.self)
        }
    }
}
