//
//  AttributeRepositoryNetworkProtocol.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 09/01/26.
//


import Foundation
import SwiftData

/// For data layer communication with network layer
protocol LevelRepositoryNetworkProtocol {
    func mapDTOToEntity(_ dto: LevelDetailDTO) -> Level
    func fetchAllLevels(completion: @escaping ([Level]) -> Void)
    func fetchLevelById(_ id: Int, completion: @escaping (Level?) -> Void)
    func fetchLevelByName(_ name: String, completion: @escaping (Level?) -> Void)
}

extension MetadataRepository: LevelRepositoryNetworkProtocol {
    func mapDTOToEntity(_ dto: LevelDetailDTO) -> Level {
        return Level(
            id: dto.id,
            name: dto.name,
            desc: dto.description
        )
    }
    
    func fetchLevelByName(_ name: String, completion: @escaping (Level?) -> Void) {
        fetcher.fetchLevelByName(name: name) { [weak self] (result: Result<LevelListResponseDTO, NetworkServiceError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                guard let fields = response.content.fields, let firstMatch = fields.first else {
                    completion(nil)
                    return
                }
                self.fetchLevelById(firstMatch.id, completion: completion)
                
            case .failure:
                completion(nil)
            }
        }
    }
    
    func fetchLevelById(_ id: Int, completion: @escaping (Level?) -> Void) {
        fetcher.fetchLevelById(id: "\(id)") { [weak self] (result: Result<LevelDetailDTO, NetworkServiceError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let dto):
                completion(self.mapDTOToEntity(dto))
            case .failure:
                completion(nil)
            }
        }
    }
    
    func fetchAllLevels(completion: @escaping ([Level]) -> Void) {
        fetcher.fetchLevelList { [weak self] (result: Result<LevelListResponseDTO, NetworkServiceError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                let group = DispatchGroup()
                var attributes: [Level] = []
                
                guard let fields = response.content.fields else {
                    return
                }
                
                for field in fields {
                    group.enter()
                    self.fetchLevelById(field.id) { entity in
                        if let entity = entity { attributes.append(entity) }
                        group.leave()
                    }
                }
                
                group.notify(queue: .main) {
                    completion(attributes.sorted { $0.id < $1.id })
                }
            case .failure:
                completion([])
            }
        }
    }
    
}
