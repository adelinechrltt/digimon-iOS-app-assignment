//
//  TypeDetailDTO.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation

struct TypeDetailDTO: JSONCodable {
    let id: Int
    let name: String
    let description: String? // Optional because the API can return null

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
    }
}
