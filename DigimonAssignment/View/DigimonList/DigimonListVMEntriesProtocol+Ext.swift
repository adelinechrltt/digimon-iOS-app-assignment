//
//  DigimonListVMEntriesProtocol+Ext.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation
import SwiftUI
import SwiftData

protocol DigimonListVMEntriesProtocol {
    func loadNextDigimonPage()
    func resetDisplayList()
    func hydrateAttributesList()
}

extension DigimonListViewModel: DigimonListVMEntriesProtocol {
    
    func loadNextDigimonPage() {
        guard !isLoading else { return }
        isLoading = true
        digiRepo.fetchPage(page: page) { [weak self] newEntities in
            let items = newEntities.map { DigimonDisplayItem.digimon($0) }
            self?.displayItems.append(contentsOf: items)
            self?.page += 1
            self?.isLoading = false
        }
    }
    
    func resetDisplayList() {
        switch selectedCategory {
        case .id, .name:
            self.page = 0
            loadNextDigimonPage()
        case .attribute:
            hydrateAttributesList()
        case .level:
            self.page = 0
            loadNextDigimonPage()
        case .type:
            self.page = 0
            loadNextDigimonPage()
        case .field:
            self.page = 0
            loadNextDigimonPage()
        }
    }
    
    func hydrateAttributesList() {
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
    }
}
