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
    func hydrateLevelsList()
    func hydrateFieldsList()
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
            hydrateLevelsList()
        case .type:
            hydrateTypesList()
        case .field:
            hydrateFieldsList()
        }
    }

    func hydrateAttributesList() {
        metadataRepo.fetcher.fetchAttributeList { [weak self] (result: Result<AttributeListResponseDTO, NetworkServiceError>) in
            guard let self = self else { return }

            switch result {
            case .success(let response):
                let items = (response.content.fields ?? []).map { field in
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

    func hydrateLevelsList() {
        metadataRepo.fetcher.fetchLevelList { [weak self] (result: Result<LevelListResponseDTO, NetworkServiceError>) in
            guard let self = self else { return }

            switch result {
            case .success(let response):
                let items = (response.content.fields ?? []).map { field in
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
                print("Error hydrating levels: \(error)")
                DispatchQueue.main.async {
                    self.displayItems = []
                    self.isLoading = false
                }
            }
        }
    }

    func hydrateTypesList() {
        metadataRepo.fetcher.fetchTypeList { [weak self] (result: Result<TypeListResponseDTO, NetworkServiceError>) in
            guard let self = self else { return }

            switch result {
            case .success(let response):
                let items = (response.content.fields ?? []).map { field in
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
                print("Error hydrating types: \(error)")
                DispatchQueue.main.async {
                    self.displayItems = []
                    self.isLoading = false
                }
            }
        }
    }

    func hydrateFieldsList() {
        metadataRepo.fetcher.fetchFieldList { [weak self] (result: Result<FieldListResponseDTO, NetworkServiceError>) in
            guard let self = self else { return }

            switch result {
            case .success(let response):
                let items = (response.content.fields ?? []).map { field in
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
                print("Error hydrating fields: \(error)")
                DispatchQueue.main.async {
                    self.displayItems = []
                    self.isLoading = false
                }
            }
        }
    }
}
