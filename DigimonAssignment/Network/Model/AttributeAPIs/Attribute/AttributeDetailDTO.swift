//
//  AttributeDetailDTO.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation

struct AttributeDetailDTO: JSONCodable {
    let id: Int
    let name: String
    let description: String

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
    }
}
