//
//  Description.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import SwiftData
import Foundation

@Model
final class Description {
    var language: String
    var desc: String
    var origin: String

    init(language: String, desc: String, origin: String) {
        self.language = language
        self.desc = desc
        self.origin = origin
    }
}
