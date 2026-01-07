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
    
    case all
    case single
    
    var path: String {
        switch self {
        case .all:
            return "pageSize=8&page="
        case .single:
            return ""
        }
    }
}
