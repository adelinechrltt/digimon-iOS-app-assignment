//
//  LevelContentDTO.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation

struct LevelContentDTO: JSONCodable {
    let name: String
    let description: String
    let fields: [LevelSummaryDTO]?

    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case fields
    }
}
