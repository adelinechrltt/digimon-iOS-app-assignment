//
//  AttributeFetcherProtocol.swift
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
            urlString: DigimonEndpoint.attribute.urlString + "/\(id)",
            method: .get,
            parameters: [:],
            body: nil,
            completion: completion)
    }
}
