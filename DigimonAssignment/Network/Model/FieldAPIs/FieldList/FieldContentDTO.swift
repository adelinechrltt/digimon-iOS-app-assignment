//
//  FieldContentDTO.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation

struct FieldContentDTO: JSONCodable {
    let name: String
    let description: String
    let fields: [FieldSummaryDTO]?

    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case fields
    }
}
