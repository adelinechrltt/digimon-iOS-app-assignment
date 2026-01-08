//
//  DigimonCard.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import SwiftUI

struct DigimonCard: View {

    let cardSize: DigimonCardSize
    let imageName: String = "https://digi-api.com/images/digimon/w/Agumon.png"
    let digimonId: Int = 1
    let digimonName: String = "Agumon"
    let digimonLevel: String = "Perfect"
    let digimonAttribute: String = "Water"
    let digimonType: String = "Normal"
    let digimonDescription: String =
        "Although it is covered by a fur pelt, it is clearly a Reptile Digimon. When it is wearing the fur pelt, its personality does a complete 180° shift."
    let digimonFields: [String] = ["lorem", "ipsum", "dolor", "sit"]

    var body: some View {
        VStack(spacing: cardSize.verticalSpacing) {
            HStack(spacing: cardSize.horizontalSpacing) {

                    AsyncImage(url: URL(string: imageName)) { phase in
                        switch phase {
                        case .empty:
                            ActivityIndicator(style: .large)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                        case .failure(_):
                            Image("DigimonLogo")
                                .resizable()
                                .scaledToFit()
                        @unknown default:
                            Image("DigimonLogo")
                                .resizable()
                                .scaledToFit()
                        }
                }
                .frame(width: cardSize.imageSize, height: cardSize.imageSize)
                VStack(alignment: .leading) {
                    switch cardSize {
                    case .minimized:
                        VStack(alignment: .leading) {
                            Text("#\(digimonId)")
                                .font(.caption2)
                                .foregroundColor(.secondary)

                            Text(digimonName)
                                .font(.headline)
                                .foregroundColor(.primary)

                            HStack {
                                Text(digimonLevel)
                                    .font(.system(size: 9))
                                    .foregroundColor(.secondary)

                                Spacer()

                                Text(digimonAttribute)
                                    .font(.system(size: 9))
                                    .foregroundColor(.secondary)

                                Spacer()

                                Text(digimonType)
                                    .font(.system(size: 9))
                                    .foregroundColor(.secondary)
                            }
                        }
                    case .expanded:
                        VStack(alignment: .leading) {
                            Text("#\(digimonId)")
                                .font(.headline)
                                .foregroundColor(.secondary)

                            Text(digimonName)
                                .font(.title2)
                                .foregroundColor(.primary)
                                .fontWeight(.bold)

                            HStack {
                                VStack {
                                    Text("Level")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    Text(digimonLevel)
                                        .font(.caption)
                                }
                                Spacer()
                                VStack {
                                    Text("Attribute")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    Text(digimonAttribute)
                                        .font(.caption)
                                }
                                Spacer()
                                VStack {
                                    Text("Type")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    Text(digimonType)
                                        .font(.caption)
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

            }

            if cardSize == .expanded {
                VStack(alignment: .center, spacing: 20) {

                    if !digimonFields.isEmpty {
                        VStack(spacing: 5) {
                            Text("Fields")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            HStack {
                                Spacer()
                                ForEach(digimonFields, id: \.self) { field in
                                    Text(field)
                                        .font(.caption)
                                        .padding(4)
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(4)

                                        Spacer()
                                }
                            }
                        }
                    }

                    VStack(spacing: 2) {
                        Text("Description")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Text(digimonDescription)
                            .font(.caption)
                            .foregroundColor(.primary)
                    }
                }
            }
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

#Preview("Minimized card") {
    VStack {
        HStack {
            DigimonCard(cardSize: .minimized)
            DigimonCard(cardSize: .minimized)
        }
        HStack {
            DigimonCard(cardSize: .minimized)
            DigimonCard(cardSize: .minimized)
        }
        HStack {
            DigimonCard(cardSize: .minimized)
            DigimonCard(cardSize: .minimized)
        }
        HStack {
            DigimonCard(cardSize: .minimized)
            DigimonCard(cardSize: .minimized)
        }
    }
    .padding(.horizontal, 10)
}

#Preview("Expanded card") {
    DigimonCard(cardSize: .expanded)
}
