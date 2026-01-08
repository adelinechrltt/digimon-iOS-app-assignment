//
//  DigimonListVMSearchProtocol+Ext.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation
import SwiftUI
import SwiftData

protocol DigimonListVMSearchProtocol {
    func onSearchBarUpdated(text: String, category: SearchCategory)
    func search(text: String, category: SearchCategory)
    func handleDigimonSearchResult(_ result: Digimon?)
}

extension DigimonListViewModel: DigimonListVMSearchProtocol {
    
    func onSearchBarUpdated(text: String, category: SearchCategory) {
        self.selectedCategory = category
        self.displayItems.removeAll()
        
        guard !text.isEmpty else {
            resetDisplayList()
            return
        }
        
        isLoading = true
        
        search(text: text, category: category)
    }
    
    func search(text: String, category: SearchCategory){
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
    
    func handleDigimonSearchResult(_ result: Digimon?) {
        DispatchQueue.main.async {
            self.displayItems = result != nil ? [.digimon(result!)] : []
            self.isLoading = false        }
    }
}
