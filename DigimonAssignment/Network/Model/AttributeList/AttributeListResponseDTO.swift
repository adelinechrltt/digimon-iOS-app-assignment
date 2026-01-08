//
//  AttributeListResponseDTO.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation

struct AttributeListResponseDTO: JSONCodable {
    let content: AttributeContentDTO
    let pageable: DigimonPageableDTO

    private enum CodingKeys: String, CodingKey {
        case content
        case pageable
    }
}
