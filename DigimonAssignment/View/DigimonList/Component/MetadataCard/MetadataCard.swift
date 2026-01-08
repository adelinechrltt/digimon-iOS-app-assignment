//
//  DigimonCard.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import SwiftUI

struct MetadataCard: View {

    let cardSize: DigimonCardSize = .minimized

    var id: Int = 1
    var name: String = "Virus"
    var desc: String = "lorem ipsum dolor sit amet"

    var body: some View {
        HStack(spacing: cardSize.horizontalSpacing) {
                VStack(alignment: .leading) {
                    Text("#\(id)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text(name)
                        .font(.headline)
                        .foregroundColor(.primary)

                    if desc != "" {
                        Text(desc)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            Spacer()
        }
        .padding(.vertical, cardSize.verticalPadding)
        .padding(.horizontal, cardSize.horizontalPadding)
        .background(
            RoundedRectangle(
                cornerRadius: cardSize.cornerRadius,
                style: .continuous
            )
            .fill(Color(.systemBackground))
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
}

#Preview {
    HStack {
        MetadataCard()
        MetadataCard()
    }
    HStack {
        MetadataCard()
        MetadataCard()
    }
}
