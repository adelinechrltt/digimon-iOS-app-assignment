//
//  DigimonNestedDTO.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//

import Foundation

struct DigimonImageDTO: JSONCodable {
    let href: String
    let transparent: Bool
}

struct DigimonLevelDTO: JSONCodable {
    let id: Int
    let level: String
}

struct DigimonTypeDTO: JSONCodable {
    let id: Int
    let type: String
}

struct DigimonAttributeDTO: JSONCodable {
    let id: Int
    let attribute: String
}

struct DigimonFieldDTO: JSONCodable {
    let id: Int
    let field: String
    let image: String
}

struct DigimonDescriptionDTO: JSONCodable {
    let origin: String
    let language: String
    let description: String
}
