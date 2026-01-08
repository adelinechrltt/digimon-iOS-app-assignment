//
//  LevelFetcherProtocol.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 09/01/26.
//

import Foundation

protocol LevelFetcherProtocol: AnyObject {
    func fetchLevelList(
        completion: @escaping (Result<LevelListResponseDTO, NetworkServiceError>) -> Void)
    
    func fetchLevelByName(
        name: String,
        completion: @escaping (Result<LevelListResponseDTO, NetworkServiceError>) -> Void)
    
    func fetchLevelById(
        id: String,
        completion: @escaping (Result<LevelDetailDTO, NetworkServiceError>) -> Void)
}

extension MetadataFetcher: LevelFetcherProtocol {
    func fetchLevelList(completion: @escaping (Result<LevelListResponseDTO, NetworkServiceError>) -> Void) {
        networkService.request(
            urlString: DigimonEndpoint.level.urlString,
            method: .get,
            parameters: [:],
            body: nil,
            completion: completion)
    }
    
    func fetchLevelByName(name: String, completion: @escaping (Result<LevelListResponseDTO, NetworkServiceError>) -> Void) {
        networkService.request(
            urlString: DigimonEndpoint.level.urlString,
            method: .get,
            parameters: ["name": name],
            body: nil,
            completion: completion)
    }
    
    func fetchLevelById(id: String, completion: @escaping (Result<LevelDetailDTO, NetworkServiceError>) -> Void) {
        networkService.request(
            urlString: DigimonEndpoint.level.urlString + "/\(id)",
            method: .get,
            parameters: [:],
            body: nil,
            completion: completion)
    }
    
}
