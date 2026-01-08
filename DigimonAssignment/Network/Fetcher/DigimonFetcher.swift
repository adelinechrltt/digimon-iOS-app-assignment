//
//  DigimonFetcher.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//

import Foundation

protocol DigimonFetcherProtocol: AnyObject {

    func fetchDigimonList(
        page: Int,
        completion: @escaping (Result<DigimonListResponseDTO, NetworkServiceError>) -> Void)

    func fetchDigimon(
        identifier: String,
        completion: @escaping (Result<DigimonDTO, NetworkServiceError>) -> Void
    )
}

final class DigimonFetcher: DigimonFetcherProtocol {

    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }

    func fetchDigimonList(
        page: Int,
        completion: @escaping (
            Result<DigimonListResponseDTO,
            NetworkServiceError>)
        -> Void
    ) {
        networkService.request(
            urlString: DigimonEndpoint.base.urlString,
            method: .get,
            parameters:
                [
                    "pageSize": "8",
                    "page": "\(page)"
                ],
            body: nil,
            completion: completion
            )
    }

    func fetchDigimon(
        identifier: String,
        completion: @escaping (
            Result<DigimonDTO,
            NetworkServiceError>)
        -> Void
    ) {
        networkService.request(
            urlString: DigimonEndpoint.base.urlString + "/\(identifier)",
            method: .get,
            parameters: [:],
            body: nil,
            completion: completion
            )
    }

    private let networkService: NetworkServiceProtocol
}
