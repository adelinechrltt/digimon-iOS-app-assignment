//
//  APIConfig.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//

import Foundation

enum APIConfig {
    static let digimonURL = "https://digi-api.com/api/v1/digimon/"
}

protocol EndpointProtocol {
    var baseURL: String { get }
    var path: String { get }
    var urlString: String { get }
    var url: URL? { get }
}

extension EndpointProtocol {
    var urlString: String {
        return baseURL + path
    }

    var url: URL? {
        return URL(string: urlString)
    }
}
