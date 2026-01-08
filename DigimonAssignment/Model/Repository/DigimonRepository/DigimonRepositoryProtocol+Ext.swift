//
//  DigimonRepositoryProtocol+Ext.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation
import SwiftData

// TODO: Offline-first caching & SSOT design pattern will be implemented later, encountered problem with modelContext & threading

/// For basic CRUD functions
protocol DigimonRepositoryProtocol {
    func save(dto: DigimonDTO) throws -> Digimon

    func fetch(identifier: Int) throws -> Digimon?
    func fetch(identifier: String) throws -> Digimon?
    func fetchCachedPage(
        page: Int,
        pageSize: Int
    ) throws -> [Digimon]

    func create(dto: DigimonDTO) -> Digimon
    func update(entity: Digimon, with dto: DigimonDTO) -> Digimon
}

extension DigimonRepository: DigimonRepositoryProtocol {

    func fetch(identifier: Int) throws -> Digimon? {
        let predicate = #Predicate<Digimon> { digimon in
            digimon.digimonId == identifier
        }

        let fetchDescriptor = FetchDescriptor<Digimon>(predicate: predicate)

        if let existing = try modelContext.fetch(fetchDescriptor).first {
            return existing
        }

        return nil
    }

    func fetch(identifier: String) throws -> Digimon? {
        let predicate = #Predicate<Digimon> { digimon in
            digimon.name == identifier
        }

        let fetchDescriptor = FetchDescriptor<Digimon>(predicate: predicate)

        if let existing = try modelContext.fetch(fetchDescriptor).first {
            return existing
        }

        return nil
    }

    func fetchCachedPage(
        page: Int,
        pageSize: Int
    ) throws -> [Digimon] {
        var descriptor = FetchDescriptor<Digimon>(
            sortBy: [SortDescriptor(\.digimonId)]
        )

        descriptor.fetchLimit = pageSize
        descriptor.fetchOffset = page * pageSize

        return try modelContext.fetch(descriptor)
    }

    func save(dto: DigimonDTO) throws -> Digimon {

        if let digimon = try fetch(identifier: dto.id) {
            return update(entity: digimon, with: dto)
        }

        return create(dto: dto)
    }

    func create(dto: DigimonDTO) -> Digimon {
    let descriptions = dto.descriptions.map {
        Description(
            language: $0.language,
            desc: $0.description,
            origin: $0.origin
        )
    }

    let entity = Digimon(
        digimonId: (dto.id),
        name: dto.name,
        xAntibody: dto.xAntibody,
        releaseDate: dto.releaseDate,
        images: dto.images.map { $0.href },
        imageTransparent: dto.images.map { $0.transparent },
        levels: dto.levels.map { $0.level },
        types: dto.types.map { $0.type },
        attributes: dto.attributes.map { $0.attribute },
        fields: dto.fields.map { $0.field },
        fieldImages: dto.fields.map { $0.image },
        descriptions: descriptions
    )

    modelContext.insert(entity)
    return entity
}

    func update(entity: Digimon, with dto: DigimonDTO) -> Digimon {
        entity.name = dto.name
        entity.xAntibody = dto.xAntibody
        entity.releaseDate = dto.releaseDate
        entity.images = dto.images.map { $0.href }
        entity.imageTransparent = dto.images.map { $0.transparent }
        entity.levels = dto.levels.map { $0.level }
        entity.types = dto.types.map { $0.type }
        entity.attributes = dto.attributes.map { $0.attribute }
        entity.fields = dto.fields.map { $0.field }
        entity.fieldImages = dto.fields.map { $0.image }

        entity.descriptions = dto.descriptions.map {
            Description(
                language: $0.language,
                desc: $0.description,
                origin: $0.origin
            )
        }

        return entity
    }
}
