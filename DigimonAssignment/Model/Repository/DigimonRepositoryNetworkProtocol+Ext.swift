//
//  DigimonRepositoryNetwork.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation
import SwiftData

/// For data layer communication with network layer
protocol DigimonRepositoryNetworkProtocol {
    func mapDTOToEntity(_ dto: DigimonDTO) -> Digimon
    func fetchPage(page: Int, completion: @escaping ([Digimon]) -> Void)
}

extension DigimonRepository: DigimonRepositoryNetworkProtocol {
    
    func mapDTOToEntity(_ dto: DigimonDTO) -> Digimon {
        return Digimon(
            digimonId: dto.id,
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
            descriptions: dto.descriptions.map {
                Description(language: $0.language, desc: $0.description, origin: $0.origin)
            }
        )
    }
    
    func fetchPage(page: Int, completion: @escaping ([Digimon]) -> Void) {
        fetcher.fetchDigimonList(page: page) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .failure(let error):
                print("List fetch error:", error)
                completion([])
                
            case .success(let response):
                let group = DispatchGroup()
                var entities: [Digimon] = []
                
                for item in response.content {
                    group.enter()
                    self.fetcher.fetchDigimon(identifier: "\(item.id)") { detailResult in
                        if case .success(let dto) = detailResult {
                            let entity = self.mapDTOToEntity(dto)
                            entities.append(entity)
                        }
                        group.leave()
                    }
                }
                
                /// Sort to maintain order
                group.notify(queue: .main) {
                    let sorted = entities.sorted { $0.digimonId < $1.digimonId }
                    completion(sorted)
                }
            }
        }
    }
}
