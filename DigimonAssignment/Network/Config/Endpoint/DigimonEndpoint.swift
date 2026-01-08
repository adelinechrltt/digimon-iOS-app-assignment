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

    case digimon
    case attribute
    case type
    case level
    case field

    var path: String {
        switch self {
        case .digimon:
            return "digimon"
        case .attribute:
            return "attribute"
        case .type:
            return "type"
        case .level:
            return "level"
        case .field:
            return "field"
        }
    }
}
