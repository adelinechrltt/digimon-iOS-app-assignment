//
//  DigimonFetcherProtocol.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//


import Foundation

protocol AttributeFetcherProtocol: AnyObject {
    func fetchAttributeList(
        completion: @escaping (Result<AttributeListResponseDTO, NetworkServiceError>) -> Void)
    
    func fetchAttributeByName(
        name: String,
        completion: @escaping (Result<AttributeListResponseDTO, NetworkServiceError>) -> Void)
    
    func fetchAttributeById(
        id: String,
        completion: @escaping (Result<AttributeDetailDTO, NetworkServiceError>) -> Void)
}

//protocol FieldFetcherProtocol: AnyObject {
//    func fetchFieldList(
//        page: Int,
//        completion: @escaping (Result<FieldListResponseDTO, NetworkServiceError>) -> Void)
//    
//    func fetchField(
//        identifier: String,
//        completion: @escaping (Result<FieldDetailDTO, NetworkServiceError>) -> Void)
//}
//
//protocol LevelFetcherProtocol: AnyObject {
//    func fetchLevelList(
//        page: Int,
//        completion: @escaping (Result<LevelListResponseDTO, NetworkServiceError>) -> Void)
//    
//    func fetchLevel(
//        identifier: String,
//        completion: @escaping (Result<LevelDetailDTO, NetworkServiceError>) -> Void)
//}
//
//protocol TypeFetcherProtocol: AnyObject {
//    func fetchTypeList(
//        page: Int,
//        completion: @escaping (Result<TypeListResponseDTO, NetworkServiceError>) -> Void)
//    
//    func fetchType(
//        identifier: String,
//        completion: @escaping (Result<TypeDetailDTO, NetworkServiceError>) -> Void)
//}

final class MetadataFetcher {
    
    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }
    
    private let networkService: NetworkServiceProtocol
}

extension MetadataFetcher: AttributeFetcherProtocol {
    
    func fetchAttributeList(
        completion: @escaping (
            Result<AttributeListResponseDTO, NetworkServiceError>
        ) -> Void
    ) {
        networkService.request(
            urlString: DigimonEndpoint.attribute.urlString,
            method: .get,
            parameters: [:],
            body: nil,
            completion: completion)
    }

    func fetchAttributeByName(
        name: String,
        completion: @escaping (
            Result<AttributeListResponseDTO, NetworkServiceError>
        ) -> Void
    ) {
        networkService.request(
            urlString: DigimonEndpoint.attribute.urlString,
            method: .get,
            parameters: ["name": name],
            body: nil,
            completion: completion)
    }
    
    func fetchAttributeById(
        id: String,
        completion: @escaping (
            Result<AttributeDetailDTO,
            NetworkServiceError>
        ) -> Void
    ) {
        networkService.request(
            urlString: DigimonEndpoint.attribute.urlString,
            method: .get,
            parameters: ["id": id],
            body: nil,
            completion: completion)
    }
}

