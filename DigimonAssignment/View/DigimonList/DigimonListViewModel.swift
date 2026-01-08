//
//  DigimonListViewModel.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation
import SwiftUI
import SwiftData

@Observable
final class DigimonListViewModel {
    let digiRepo: DigimonRepository
    let metadataRepo: MetadataRepository
    
    var selectedCategory: SearchCategory = .name
    
    var displayItems: [DigimonDisplayItem] = []
    var isLoading = false
    var page = 0
    
    let pageSize = 8
    
    init(modelContext: ModelContext) {
        digiRepo = DigimonRepository(modelContext: modelContext)
        metadataRepo = MetadataRepository()
    }
}
