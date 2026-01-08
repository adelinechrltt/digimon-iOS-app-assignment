//
//  DigimonRepository.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//


final class DigimonRepository {

    let modelContext: ModelContext
    let fetcher: DigimonFetcher

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        self.fetcher = DigimonFetcher()
    }
}
