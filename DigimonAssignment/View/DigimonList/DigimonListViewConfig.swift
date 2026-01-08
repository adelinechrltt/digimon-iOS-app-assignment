//
//  DigimonListViewConfig.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation

enum DigimonDisplayItem: Identifiable {
    case digimon(Digimon)
    case metadata(id: Int, name: String, desc: String)

    var id: String {
        switch self {
        case .digimon(let d): return "d-\(d.digimonId)"
        case .metadata(let id, let name, _): return "m-\(id)-\(name)"
        }
    }
}
