//
//  Digimon.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation
import SwiftData

@Model
final class Digimon {
    @Attribute(.unique) var digimonId: Int
    var name: String
    var xAntibody: Bool
    var releaseDate: String?

    var images: [String]
    var imageTransparent: [Bool]

    var levels: [String]
    var types: [String]
    var attributes: [String]
    var fields: [String]
    var fieldImages: [String]

    @Relationship var descriptions: [Description]

    init(
        digimonId: Int,
        name: String,
        xAntibody: Bool,
        releaseDate: String?,
        images: [String] = [],
        imageTransparent: [Bool] = [],
        levels: [String] = [],
        types: [String] = [],
        attributes: [String] = [],
        fields: [String] = [],
        fieldImages: [String] = [],
        descriptions: [Description] = []
    ) {
        self.digimonId = digimonId
        self.name = name
        self.xAntibody = xAntibody
        self.releaseDate = releaseDate
        self.images = images
        self.imageTransparent = imageTransparent
        self.levels = levels
        self.types = types
        self.attributes = attributes
        self.fields = fields
        self.fieldImages = fieldImages
        self.descriptions = descriptions
    }
}
