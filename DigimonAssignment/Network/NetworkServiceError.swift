//
//  NetworkServiceError.swift
//  DigimonAssignment
//
//  Created by Adeline Charlotte Augustinne on 07/01/26.
//

enum NetworkServiceError: Error {
    case invalidURL
    case bodyParsingFailed
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
    case statusCode(Int)
    case noInternetConnection
}
