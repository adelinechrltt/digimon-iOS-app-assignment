//
//  DigimonListViewModel.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 08/01/26.
//

import Foundation
import SwiftUI

@Observable
final class DigimonListViewModel {
    var digimons: [Digimon] = []
    var isLoading = false
    var page = 0
    
    let pageSize = 8
    
    init() {
        digimons =
        [
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
                fields: ["Deep Savers", "Dragon's Roar"],
                fieldImages: [],
                descriptions: [Description(language: "en_us", desc: "Small dinosaur Digimon.", origin: "reference_book")]
            ),
            Digimon(
                digimonId: 2,
                name: "Gabumon",
                xAntibody: false,
                releaseDate: "1997",
                images: ["https://digi-api.com/images/digimon/w/Gabumon.png"],
                imageTransparent: [true],
                levels: ["Child"],
                types: ["Reptile"],
                attributes: ["Data"],
                fields: ["Deep Savers", "Metal Empire"],
                fieldImages: [],
                descriptions: [Description(language: "en_us", desc: "A Digimon with a fur coat.", origin: "reference_book")]
            ),
            Digimon(
                digimonId: 3,
                name: "Patamon",
                xAntibody: false,
                releaseDate: "1997",
                images: ["https://digi-api.com/images/digimon/w/Patamon.png"],
                imageTransparent: [true],
                levels: ["Child"],
                types: ["Mammal"],
                attributes: ["Vaccine"],
                fields: ["Nature Spirits", "Virus Busters"],
                fieldImages: [],
                descriptions: [Description(language: "en_us", desc: "Flying Digimon with big ears.", origin: "reference_book")]
            ),
            Digimon(
                digimonId: 4,
                name: "Gomamon",
                xAntibody: false,
                releaseDate: "1997",
                images: ["https://digi-api.com/images/digimon/w/Gomamon.png"],
                imageTransparent: [true],
                levels: ["Child"],
                types: ["Aquatic"],
                attributes: ["Data"],
                fields: ["Deep Savers", "Dragon's Roar"],
                fieldImages: [],
                descriptions: [Description(language: "en_us", desc: "Playful aquatic Digimon.", origin: "reference_book")]
            ),
            Digimon(
                digimonId: 5,
                name: "Tentomon",
                xAntibody: false,
                releaseDate: "1997",
                images: ["https://digi-api.com/images/digimon/w/Tentomon.png"],
                imageTransparent: [true],
                levels: ["Child"],
                types: ["Insect"],
                attributes: ["Vaccine"],
                fields: ["Metal Empire", "Nightmare Soldiers"],
                fieldImages: [],
                descriptions: [Description(language: "en_us", desc: "Red insect Digimon.", origin: "reference_book")]
            ),
            Digimon(
                digimonId: 6,
                name: "Palmon",
                xAntibody: false,
                releaseDate: "1997",
                images: ["https://digi-api.com/images/digimon/w/Palmon.png"],
                imageTransparent: [true],
                levels: ["Child"],
                types: ["Plant"],
                attributes: ["Data"],
                fields: ["Nature Spirits", "Virus Busters"],
                fieldImages: [],
                descriptions: [Description(language: "en_us", desc: "Plant Digimon with flower hands.", origin: "reference_book")]
            ),
            Digimon(
                digimonId: 7,
                name: "Gatomon",
                xAntibody: false,
                releaseDate: "1997",
                images: ["https://digi-api.com/images/digimon/w/Gatomon.png"],
                imageTransparent: [true],
                levels: ["Child"],
                types: ["Mammal"],
                attributes: ["Vaccine"],
                fields: ["Deep Savers", "Dragon's Roar"],
                fieldImages: [],
                descriptions: [Description(language: "en_us", desc: "Cat Digimon with gloves.", origin: "reference_book")]
            ),
            Digimon(
                digimonId: 8,
                name: "Patamon",
                xAntibody: false,
                releaseDate: "1997",
                images: ["https://digi-api.com/images/digimon/w/Patamon.png"],
                imageTransparent: [true],
                levels: ["Child"],
                types: ["Mammal"],
                attributes: ["Data"],
                fields: ["Nature Spirits", "Virus Busters"],
                fieldImages: [],
                descriptions: [Description(language: "en_us", desc: "Flying Digimon with big ears.", origin: "reference_book")]
            )
        ]
    }
    
    func loadNextPage() {
            guard !isLoading else { return }
            isLoading = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                guard let self = self else { return }
                
                let startIndex = self.page * self.pageSize
                let endIndex = min(startIndex + self.pageSize, self.digimons.count)
                
                guard startIndex < endIndex else {
                    self.isLoading = false
                    return
                }
                
                let newDigimons = Array(self.digimons[startIndex..<endIndex])
                self.digimons.append(contentsOf: newDigimons)
                self.page += 1
                self.isLoading = false
            }
        }
}
