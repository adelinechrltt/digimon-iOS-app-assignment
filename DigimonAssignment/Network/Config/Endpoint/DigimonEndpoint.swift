//
//  DigimonEndpoint.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//

import Foundation

enum DigimonEndpoint: EndpointProtocol {
    var baseURL: String {
        return APIConfig.digimonURL
    }

    case base

    var path: String {
        switch self {
        case .base:
            return ""
        }
    }
}
