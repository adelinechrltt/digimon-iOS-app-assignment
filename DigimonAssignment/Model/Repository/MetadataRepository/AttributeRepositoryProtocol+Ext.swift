//
//  DigimonRepositoryNetworkProtocol.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation
import SwiftData

/// For data layer communication with network layer
protocol AttributeRepositoryNetworkProtocol {
    func mapDTOToEntity(_ dto: AttributeDetailDTO) -> Attribute
    func fetchAll(completion: @escaping ([Attribute]) -> Void)
    func fetchById(_ id: Int, completion: @escaping (Attribute?) -> Void)
    func fetchByName(_ name: String, completion: @escaping (Attribute?) -> Void)
}

extension MetadataRepository: AttributeRepositoryNetworkProtocol {
    func mapDTOToEntity(_ dto: AttributeDetailDTO) -> Attribute {
        return Attribute(
            id: dto.id,
            name: dto.name,
            desc: dto.description
        )
    }
    
    func fetchByName(_ name: String, completion: @escaping (Attribute?) -> Void) {
        fetcher.fetchAttributeByName(name: name) { [weak self] (result: Result<AttributeListResponseDTO, NetworkServiceError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                guard let firstMatch = response.content.fields.first else {
                    completion(nil)
                    return
                }
                self.fetchById(firstMatch.id, completion: completion)
                
            case .failure:
                completion(nil)
            }
        }
    }
    
    func fetchById(_ id: Int, completion: @escaping (Attribute?) -> Void) {
        fetcher.fetchAttributeById(id: "\(id)") { [weak self] (result: Result<AttributeDetailDTO, NetworkServiceError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let dto):
                completion(self.mapDTOToEntity(dto))
            case .failure:
                completion(nil)
            }
        }
    }
    
    func fetchAll(completion: @escaping ([Attribute]) -> Void) {
        fetcher.fetchAttributeList { [weak self] (result: Result<AttributeListResponseDTO, NetworkServiceError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                let group = DispatchGroup()
                var attributes: [Attribute] = []
                
                for field in response.content.fields {
                    group.enter()
                    self.fetchById(field.id) { entity in
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
