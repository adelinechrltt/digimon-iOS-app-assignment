//
//  TypeSummaryDTO.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation

struct TypeSummaryDTO: JSONCodable {
    let id: Int
    let name: String
    let href: String

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case href
    }
}
