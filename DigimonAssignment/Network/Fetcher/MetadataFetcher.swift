//
//  MetadataFetcher.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 09/01/26.
//

import Foundation

final class MetadataFetcher {
    
    init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }
    
    let networkService: NetworkServiceProtocol
}
