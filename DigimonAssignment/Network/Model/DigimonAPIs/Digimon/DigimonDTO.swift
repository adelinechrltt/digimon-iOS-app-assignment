//
//  DigimonDTO.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//

import Foundation

struct DigimonDTO: JSONCodable {
    let id: Int
    let name: String
    let xAntibody: Bool
    let images: [DigimonImageDTO]
    let levels: [DigimonLevelDTO]
    let types: [DigimonTypeDTO]
    let attributes: [DigimonAttributeDTO]
    let fields: [DigimonFieldDTO]
    let releaseDate: String
    let descriptions: [DigimonDescriptionDTO]

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case xAntibody
        case images
        case levels
        case types
        case attributes
        case fields
        case releaseDate
        case descriptions
    }
}
