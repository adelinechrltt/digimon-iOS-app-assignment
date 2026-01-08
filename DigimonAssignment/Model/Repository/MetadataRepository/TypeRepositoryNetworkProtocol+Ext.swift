//
//  TypeRepositoryNetworkProtocol+Ext.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 09/01/26.
//


import Foundation
import SwiftData

/// For data layer communication with network layer
protocol TypeRepositoryNetworkProtocol {
    func mapDTOToEntity(_ dto: TypeDetailDTO) -> TypeEntity
    func fetchAllTypes(completion: @escaping ([TypeEntity]) -> Void)
    func fetchTypeById(_ id: Int, completion: @escaping (TypeEntity?) -> Void)
    func fetchTypeByName(_ name: String, completion: @escaping (TypeEntity?) -> Void)
}

extension MetadataRepository: TypeRepositoryNetworkProtocol {
    func mapDTOToEntity(_ dto: TypeDetailDTO) -> TypeEntity {
        return TypeEntity(
            id: dto.id,
            name: dto.name,
            desc: dto.description
        )
    }
    
    func fetchTypeByName(_ name: String, completion: @escaping (TypeEntity?) -> Void) {
        fetcher.fetchTypeByName(name: name) { [weak self] (result: Result<TypeListResponseDTO, NetworkServiceError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                guard let fields = response.content.fields, let firstMatch = fields.first else {
                    completion(nil)
                    return
                }
                self.fetchTypeById(firstMatch.id, completion: completion)
                
            case .failure:
                completion(nil)
            }
        }
    }
    
    func fetchTypeById(_ id: Int, completion: @escaping (TypeEntity?) -> Void) {
        fetcher.fetchTypeById(id: "\(id)") { [weak self] (result: Result<TypeDetailDTO, NetworkServiceError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let dto):
                completion(self.mapDTOToEntity(dto))
            case .failure:
                completion(nil)
            }
        }
    }
    
    func fetchAllTypes(completion: @escaping ([TypeEntity]) -> Void) {
        fetcher.fetchTypeList { [weak self] (result: Result<TypeListResponseDTO, NetworkServiceError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                let group = DispatchGroup()
                var attributes: [TypeEntity] = []
                
                guard let fields = response.content.fields else {
                    return
                }
                
                for field in fields {
                    group.enter()
                    self.fetchTypeById(field.id) { entity in
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
