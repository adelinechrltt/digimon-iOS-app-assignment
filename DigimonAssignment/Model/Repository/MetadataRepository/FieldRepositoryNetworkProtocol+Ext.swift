//
//  TypeRepositoryNetworkProtocol.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 09/01/26.
//


import Foundation
import SwiftData

/// For data layer communication with network layer
protocol FieldRepositoryNetworkProtocol {
    func mapDTOToEntity(_ dto: FieldDetailDTO) -> Field
    func fetchAllFields(completion: @escaping ([Field]) -> Void)
    func fetchFieldById(_ id: Int, completion: @escaping (Field?) -> Void)
    func fetchFieldByName(_ name: String, completion: @escaping (Field?) -> Void)
}

extension MetadataRepository: FieldRepositoryNetworkProtocol {
    func mapDTOToEntity(_ dto: FieldDetailDTO) -> Field {
        return Field(
            id: dto.id,
            name: dto.name,
            desc: dto.description,
            imageURL: dto.image
        )
    }
    
    func fetchFieldByName(_ name: String, completion: @escaping (Field?) -> Void) {
        fetcher.fetchFieldByName(name: name) { [weak self] (result: Result<FieldListResponseDTO, NetworkServiceError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                guard let fields = response.content.fields, let firstMatch = fields.first else {
                    completion(nil)
                    return
                }
                self.fetchFieldById(firstMatch.id, completion: completion)
                
            case .failure:
                completion(nil)
            }
        }
    }
    
    func fetchFieldById(_ id: Int, completion: @escaping (Field?) -> Void) {
        fetcher.fetchFieldById(id: "\(id)") { [weak self] (result: Result<FieldDetailDTO, NetworkServiceError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let dto):
                completion(self.mapDTOToEntity(dto))
            case .failure:
                completion(nil)
            }
        }
    }
    
    func fetchAllFields(completion: @escaping ([Field]) -> Void) {
        fetcher.fetchFieldList { [weak self] (result: Result<FieldListResponseDTO, NetworkServiceError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                let group = DispatchGroup()
                var attributes: [Field] = []
                
                guard let fields = response.content.fields else {
                    return
                }
                
                for field in fields {
                    group.enter()
                    self.fetchFieldById(field.id) { entity in
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
