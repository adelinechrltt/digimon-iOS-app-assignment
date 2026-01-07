//
//  DigimonFetcher.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//

import Foundation

protocol DigimonFetcherProtocol: AnyObject {

//    func fetchDigimonList(
//        page: Int,
//        completion: @escaping (Result<DigimonDTOArray, NetworkServiceError>) -> Void)
    
    func fetchDigimon(
        identifier: String,
        completion: @escaping (Result<DigimonDTO, NetworkServiceError>) -> Void
    )
}

final class DigimonFetcher: DigimonFetcherProtocol {
    
    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }
    
//    func fetchDigimonList(
//        page: Int, 
//        completion: @escaping (
//            Result<DigimonDTOArray,
//            NetworkServiceError>)
//        -> Void
//    ) {
//        networkService.request(
//            urlString: DigimonEndpoint.all.urlString,
//            method: .get,
//            parameters:
//                ["page": "\(page)"],
//            completion: completion
//            )
//    }
    
    func fetchDigimon(
        identifier: String,
        completion: @escaping (
            Result<DigimonDTO,
            NetworkServiceError>)
        -> Void
    ) {
        networkService.request(
            urlString: DigimonEndpoint.single.urlString + "\(identifier)",
            method: .get,
            parameters:
                [:],
            body: nil,
            completion: completion
            )
    }
    
    private let networkService: NetworkServiceProtocol
}
