//
//  DigimonCardConfig.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation
import SwiftUI

enum DigimonCardSize {
    case minimized
    case expanded

    var imageSize: CGFloat {
        switch self {
        case .minimized:
            return 50
        case .expanded:
            return 100
        }
    }

    var horizontalSpacing: CGFloat {
        switch self {
        case .minimized:
            return 10
        case .expanded:
            return 20
        }
    }

    var verticalSpacing: CGFloat {
        switch self {
        case .minimized:
            return 0
        case .expanded:
            return 10
        }
    }

    var verticalPadding: CGFloat {
        switch self {
        case .minimized:
            return 10
        case .expanded:
            return 20
        }
    }

    var horizontalPadding: CGFloat {
        switch self {
        case .minimized:
            return 10
        case .expanded:
            return 30
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .minimized:
            return 12
        case .expanded:
            return 16
        }
    }
}
