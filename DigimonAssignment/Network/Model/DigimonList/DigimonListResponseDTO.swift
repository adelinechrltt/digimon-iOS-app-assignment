//
//  DigimonListResponseDTO.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//

import Foundation

struct DigimonListResponseDTO: JSONCodable {
    let content: [DigimonListItemDTO]
    let pageable: DigimonPageableDTO

    private enum CodingKeys: String, CodingKey {
        case content
        case pageable
    }
}
