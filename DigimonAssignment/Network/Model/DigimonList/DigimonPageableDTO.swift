//
//  DigimonPageableDTO.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//

import Foundation

struct DigimonPageableDTO: JSONCodable {
    let currentPage: Int
    let elementsOnPage: Int
    let totalElements: Int
    let totalPages: Int
    let previousPage: String
    let nextPage: String

    private enum CodingKeys: String, CodingKey {
        case currentPage
        case elementsOnPage
        case totalElements
        case totalPages
        case previousPage
        case nextPage
    }
}
