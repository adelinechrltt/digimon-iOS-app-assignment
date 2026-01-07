//
//  DigimonDTO.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//

struct DigimonDTO: JSONCodable {
    let id: Int
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

typealias DigimonDTOArray = JSONArray<DigimonDTO>
