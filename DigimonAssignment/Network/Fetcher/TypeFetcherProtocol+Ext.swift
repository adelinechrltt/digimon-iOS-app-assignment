//
//  LevelFetcherProtocol.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 09/01/26.
//


import Foundation

protocol TypeFetcherProtocol: AnyObject {
    func fetchTypeList(
        completion: @escaping (
            Result<TypeListResponseDTO, NetworkServiceError>) -> Void)
    
    func fetchTypeByName(
        name: String,
        completion: @escaping (
            Result<TypeListResponseDTO, NetworkServiceError>) -> Void)
    
    func fetchTypeById(
        id: String,
        completion: @escaping (
            Result<TypeDetailDTO, NetworkServiceError>) -> Void)
}

extension MetadataFetcher: TypeFetcherProtocol {
    func fetchTypeList(completion: @escaping (Result<TypeListResponseDTO, NetworkServiceError>) -> Void) {
        networkService.request(
            urlString: DigimonEndpoint.type.urlString,
            method: .get,
            parameters: [:],
            body: nil,
            completion: completion)
    }
    
    func fetchTypeByName(name: String, completion: @escaping (Result<TypeListResponseDTO, NetworkServiceError>) -> Void) {
        networkService.request(
            urlString: DigimonEndpoint.type.urlString,
            method: .get,
            parameters: ["name": name],
            body: nil,
            completion: completion)
    }
    
    func fetchTypeById(id: String, completion: @escaping (Result<TypeDetailDTO, NetworkServiceError>) -> Void) {
        networkService.request(
            urlString: DigimonEndpoint.type.urlString + "/\(id)",
            method: .get,
            parameters: [:],
            body: nil,
            completion: completion)
    }
    
}
