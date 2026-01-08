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
    private let digiRepo: DigimonRepository
    private let metadataRepo: MetadataRepository
    
    var selectedCategory: SearchCategory = .name
    
    var displayItems: [DigimonDisplayItem] = []
    var isLoading = false
    var page = 0
    
    let pageSize = 8
    
    init(modelContext: ModelContext) {
        digiRepo = DigimonRepository(modelContext: modelContext)
        metadataRepo = MetadataRepository()
    }
    
    func loadNextPage() {
        guard !isLoading else { return }
        isLoading = true
        digiRepo.fetchPage(page: page) { [weak self] newEntities in
            let items = newEntities.map { DigimonDisplayItem.digimon($0) }
            self?.displayItems.append(contentsOf: items)
            self?.page += 1
            self?.isLoading = false
        }
    }
    
    func search(text: String, category: SearchCategory) {
        self.selectedCategory = category
        self.displayItems.removeAll()
        
        guard !text.isEmpty else {
            switch selectedCategory {
            case .id:
                self.page = 0
                loadNextPage()
            case .name:
                self.page = 0
                loadNextPage()
            case .attribute:
                metadataRepo.fetcher.fetchAttributeList { [weak self] (result: Result<AttributeListResponseDTO, NetworkServiceError>) in
                    guard let self = self else { return }
                    
                    switch result {
                    case .success(let response):
                        let items = response.content.fields.map { field in
                            DigimonDisplayItem.metadata(
                                id: field.id,
                                name: field.name,
                                desc: ""
                            )
                        }
                        
                        DispatchQueue.main.async {
                            self.displayItems = items
                            self.isLoading = false
                        }
                        
                    case .failure(let error):
                        print("Error hydrating attributes: \(error)")
                        DispatchQueue.main.async {
                            self.displayItems = []
                            self.isLoading = false
                        }
                    }
                }
            case .level:
                self.page = 0
                loadNextPage()
            case .type:
                self.page = 0
                loadNextPage()
            case .field:
                self.page = 0
                loadNextPage()
            }
            return
        }
        
        isLoading = true
        
        switch category {
        case .id, .name:
            if category == .id, let id = Int(text) {
                digiRepo.fetchById(id: id) { [weak self] res in self?.handleDigimonSearchResult(res) }
            } else {
                digiRepo.fetchByName(name: text) { [weak self] res in self?.handleDigimonSearchResult(res) }
            }
        case .attribute:
            metadataRepo.fetchByName(text) { [weak self] res in
                if let attr = res {
                    self?.displayItems = [.metadata(id: attr.id, name: attr.name, desc: attr.desc)]
                }
                self?.isLoading = false
            }
            // Handle .level, .type, .field similarly...
        default:
            isLoading = false
        }
    }
    
    private func handleDigimonSearchResult(_ result: Digimon?) {
        DispatchQueue.main.async {
            self.displayItems = result != nil ? [.digimon(result!)] : []
            self.isLoading = false        }
    }
}
