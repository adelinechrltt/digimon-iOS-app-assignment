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
    private let repository: DigimonRepository
    
    var digimons: [Digimon] = []
    var isLoading = false
    var page = 0
    
    let pageSize = 8
    
    init(modelContext: ModelContext) {
        repository = DigimonRepository(modelContext: modelContext)
    }
    
    func loadNextPage() {
        guard !isLoading else { return }
            isLoading = true
            
            repository.fetchPage(page: page) { [weak self] newEntities in
                guard let self = self else { return }
                
                self.digimons.append(contentsOf: newEntities)
                self.page += 1
                self.isLoading = false
        }
    }
}
