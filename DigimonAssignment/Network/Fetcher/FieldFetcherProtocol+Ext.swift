//
//  FieldFetcherProtocol.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 09/01/26.
//

import Foundation

protocol FieldFetcherProtocol: AnyObject {
    func fetchFieldList(
        completion: @escaping (
            Result<FieldListResponseDTO, NetworkServiceError>) -> Void)
    
    func fetchFieldByName(
        name: String,
        completion: @escaping (
            Result<FieldListResponseDTO, NetworkServiceError>) -> Void)
    
    func fetchFieldById(
        id: String,
        completion: @escaping (
            Result<FieldDetailDTO, NetworkServiceError>) -> Void)
}

extension MetadataFetcher: FieldFetcherProtocol {
    func fetchFieldList(completion: @escaping (Result<FieldListResponseDTO, NetworkServiceError>) -> Void) {
        networkService.request(
            urlString: DigimonEndpoint.field.urlString,
            method: .get,
            parameters: [:],
            body: nil,
            completion: completion)
    }
    
    func fetchFieldByName(name: String, completion: @escaping (Result<FieldListResponseDTO, NetworkServiceError>) -> Void) {
        networkService.request(
            urlString: DigimonEndpoint.field.urlString,
            method: .get,
            parameters: ["name": name],
            body: nil,
            completion: completion)
    }
    
    func fetchFieldById(id: String, completion: @escaping (Result<FieldDetailDTO, NetworkServiceError>) -> Void) {
        networkService.request(
            urlString: DigimonEndpoint.field.urlString + "/\(id)",
            method: .get,
            parameters: [:],
            body: nil,
            completion: completion)
    }
    
}
