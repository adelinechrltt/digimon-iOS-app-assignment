//
//  Field.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation
import SwiftData

@Model
final class Field {
    @Attribute(.unique) var id: Int
    var name: String
    var desc: String
    var imageURL: String

    init(id: Int, name: String, desc: String, imageURL: String) {
        self.id = id
        self.name = name
        self.desc = desc
        self.imageURL = imageURL
    }
}
