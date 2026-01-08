//
//  DigimonListItemDTO.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//

import Foundation

struct DigimonListItemDTO: JSONCodable {
    let id: Int
    let name: String
    let href: String
    let image: String

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case href
        case image
    }
}
