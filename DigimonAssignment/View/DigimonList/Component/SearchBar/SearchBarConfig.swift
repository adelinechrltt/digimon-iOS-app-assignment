//
//  SearchBarConfig.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation
import SwiftUI

enum SearchCategory: String, CaseIterable, Identifiable {
    case id = "ID"
    case name = "Name"
    case type = "Type"
    case level = "Level"
    case attribute = "Attribute"
    case field = "Field"

    var id: String { rawValue }
}
