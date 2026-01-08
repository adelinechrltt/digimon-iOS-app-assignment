//
//  DigimonCard.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import SwiftUI

struct DigimonCard: View {

    let cardSize: DigimonCardSize
    let digimon: Digimon
    
    var body: some View {
        VStack(spacing: cardSize.verticalSpacing) {
            HStack(spacing: cardSize.horizontalSpacing) {

                AsyncImage(url: URL(string: digimon.images.first ?? "Lorem ipsum")) { phase in
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
                            Text("#\(digimon.digimonId)")
                                .font(.caption2)
                                .foregroundColor(.secondary)

                            Text(digimon.name)
                                .font(.headline)
                                .foregroundColor(.primary)
                                .lineLimit(1)

                            HStack {
                                if let level =  digimon.levels.first,
                                   level != "" {
                                    Text(level)
                                        .font(.system(size: 9))
                                        .foregroundColor(.secondary)
                                        .lineLimit(1)
                                    Spacer()
                                }

                                if let attribute = digimon.attributes.first, attribute != "" {
                                    Text(attribute)
                                        .font(.system(size: 9))
                                        .foregroundColor(.secondary)
                                        .lineLimit(1)
                                    
                                    Spacer()
                                }
                                
                                if let type = digimon.types.first, type != "" {
                                    Text(digimon.types.first ?? "")
                                        .font(.system(size: 9))
                                        .foregroundColor(.secondary)
                                        .lineLimit(1)
                                }
                            }
                        }
                    case .expanded:
                        VStack(alignment: .leading) {
                            Text("#\(digimon.digimonId)")
                                .font(.headline)
                                .foregroundColor(.secondary)

                            Text(digimon.name)
                                .font(.title2)
                                .foregroundColor(.primary)
                                .fontWeight(.bold)

                            HStack {
                                VStack {
                                    Text("Level")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    Text(digimon.levels.first ?? "Lorem ipsum")
                                        .font(.caption)
                                }
                                Spacer()
                                VStack {
                                    Text("Attribute")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    Text(digimon.attributes.first ?? "Lorem ipsum")
                                        .font(.caption)
                                }
                                Spacer()
                                VStack {
                                    Text("Type")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                    Text(digimon.types.first ?? "Lorem ipsum")
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

                    if !digimon.fields.isEmpty {
                        VStack(spacing: 5) {
                            Text("Fields")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            HStack {
                                Spacer()
                                ForEach(digimon.fields, id: \.self) { field in
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
                        Text(getEnglishDescription())
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
    
    private func getEnglishDescription() -> String {
        if let engDesc = digimon.descriptions.first(where: { $0.language.contains("en") })?.desc {
            return engDesc
        }
        return digimon.descriptions.first?.desc ?? "No description available."
    }
}

#Preview("Minimized card") {
    VStack {
        HStack {
            DigimonCard(
                cardSize: .minimized,
                digimon:
                    Digimon(
                        digimonId: 1,
                        name: "Agumon",
                        xAntibody: false,
                        releaseDate: "1997",
                        images: ["https://digi-api.com/images/digimon/w/Agumon.png"],
                        imageTransparent: [true],
                        levels: ["Child"],
                        types: ["Reptile"],
                        attributes: ["Vaccine"],
                        fields: [
                            "Deep Savers",
                            "Dragon's Roar",
                            "Metal Empire",
                            "Nature Spirits",
                            "Nightmare Soldiers",
                            "Virus Busters"
                        ],
                        fieldImages: [],
                        descriptions: [
                            Description(
                                language: "en_us",
                                desc:
                                    "A Reptile Digimon with an appearance resembling a small dinosaur, it has grown and become able to walk on two legs.",
                                origin: "reference_book")
                        ]))
            DigimonCard(
                cardSize: .minimized,
                digimon:
                    Digimon(
                        digimonId: 1,
                        name: "Agumon",
                        xAntibody: false,
                        releaseDate: "1997",
                        images: ["https://digi-api.com/images/digimon/w/Agumon.png"],
                        imageTransparent: [true],
                        levels: ["Child"],
                        types: ["Reptile"],
                        attributes: ["Vaccine"],
                        fields: [
                            "Deep Savers",
                            "Dragon's Roar",
                            "Metal Empire",
                            "Nature Spirits",
                            "Nightmare Soldiers",
                            "Virus Busters"
                        ],
                        fieldImages: [],
                        descriptions: [
                            Description(
                                language: "en_us",
                                desc:
                                    "A Reptile Digimon with an appearance resembling a small dinosaur, it has grown and become able to walk on two legs.",
                                origin: "reference_book")
                        ]))
        }
        HStack {
            DigimonCard(
                cardSize: .minimized,
                digimon:
                    Digimon(
                        digimonId: 1,
                        name: "Agumon",
                        xAntibody: false,
                        releaseDate: "1997",
                        images: ["https://digi-api.com/images/digimon/w/Agumon.png"],
                        imageTransparent: [true],
                        levels: ["Child"],
                        types: ["Reptile"],
                        attributes: ["Vaccine"],
                        fields: [
                            "Deep Savers",
                            "Dragon's Roar",
                            "Metal Empire",
                            "Nature Spirits",
                            "Nightmare Soldiers",
                            "Virus Busters"
                        ],
                        fieldImages: [],
                        descriptions: [
                            Description(
                                language: "en_us",
                                desc:
                                    "A Reptile Digimon with an appearance resembling a small dinosaur, it has grown and become able to walk on two legs.",
                                origin: "reference_book")
                        ]))
            DigimonCard(
                cardSize: .minimized,
                digimon:
                    Digimon(
                        digimonId: 1,
                        name: "Agumon",
                        xAntibody: false,
                        releaseDate: "1997",
                        images: ["https://digi-api.com/images/digimon/w/Agumon.png"],
                        imageTransparent: [true],
                        levels: ["Child"],
                        types: ["Reptile"],
                        attributes: ["Vaccine"],
                        fields: [
                            "Deep Savers",
                            "Dragon's Roar",
                            "Metal Empire",
                            "Nature Spirits",
                            "Nightmare Soldiers",
                            "Virus Busters"
                        ],
                        fieldImages: [],
                        descriptions: [
                            Description(
                                language: "en_us",
                                desc:
                                    "A Reptile Digimon with an appearance resembling a small dinosaur, it has grown and become able to walk on two legs.",
                                origin: "reference_book")
                        ]))
        }
        HStack {
            DigimonCard(
                cardSize: .minimized,
                digimon:
                    Digimon(
                        digimonId: 1,
                        name: "Agumon",
                        xAntibody: false,
                        releaseDate: "1997",
                        images: ["https://digi-api.com/images/digimon/w/Agumon.png"],
                        imageTransparent: [true],
                        levels: ["Child"],
                        types: ["Reptile"],
                        attributes: ["Vaccine"],
                        fields: [
                            "Deep Savers",
                            "Dragon's Roar",
                            "Metal Empire",
                            "Nature Spirits",
                            "Nightmare Soldiers",
                            "Virus Busters"
                        ],
                        fieldImages: [],
                        descriptions: [
                            Description(
                                language: "en_us",
                                desc:
                                    "A Reptile Digimon with an appearance resembling a small dinosaur, it has grown and become able to walk on two legs.",
                                origin: "reference_book")
                        ]))
            DigimonCard(
                cardSize: .minimized,
                digimon:
                    Digimon(
                        digimonId: 1,
                        name: "Agumon",
                        xAntibody: false,
                        releaseDate: "1997",
                        images: ["https://digi-api.com/images/digimon/w/Agumon.png"],
                        imageTransparent: [true],
                        levels: ["Child"],
                        types: ["Reptile"],
                        attributes: ["Vaccine"],
                        fields: [
                            "Deep Savers",
                            "Dragon's Roar",
                            "Metal Empire",
                            "Nature Spirits",
                            "Nightmare Soldiers",
                            "Virus Busters"
                        ],
                        fieldImages: [],
                        descriptions: [
                            Description(
                                language: "en_us",
                                desc:
                                    "A Reptile Digimon with an appearance resembling a small dinosaur, it has grown and become able to walk on two legs.",
                                origin: "reference_book")
                        ]))
        }
    }
    .padding(.horizontal, 10)
}

#Preview("Expanded card") {
    DigimonCard(
        cardSize: .expanded,
        digimon:
            Digimon(
                digimonId: 1,
                name: "Agumon",
                xAntibody: false,
                releaseDate: "1997",
                images: ["https://digi-api.com/images/digimon/w/Agumon.png"],
                imageTransparent: [true],
                levels: ["Child"],
                types: ["Reptile"],
                attributes: ["Vaccine"],
                fields: [
                    "Deep Savers",
                    "Dragon's Roar",
                    "Metal Empire",
                    "Nature Spirits",
                    "Nightmare Soldiers",
                    "Virus Busters"
                ],
                fieldImages: [],
                descriptions: [
                    Description(
                        language: "en_us",
                        desc:
                            "A Reptile Digimon with an appearance resembling a small dinosaur, it has grown and become able to walk on two legs.",
                        origin: "reference_book")
                ]))
}
