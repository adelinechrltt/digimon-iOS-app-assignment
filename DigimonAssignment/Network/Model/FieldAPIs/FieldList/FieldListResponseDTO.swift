//
//  FieldListResponseDTO.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation

struct FieldListResponseDTO: JSONCodable {
    let content: FieldContentDTO
    let pageable: DigimonPageableDTO

    private enum CodingKeys: String, CodingKey {
        case content
        case pageable
    }
}
