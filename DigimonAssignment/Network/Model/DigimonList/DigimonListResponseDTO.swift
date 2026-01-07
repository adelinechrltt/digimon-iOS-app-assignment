struct DigimonListResponseDTO: JSONCodable {
    let content: [DigimonListItemDTO]
    let pageable: DigimonPageableDTO

    private enum CodingKeys: String, CodingKey {
        case content
        case pageable
    }
}