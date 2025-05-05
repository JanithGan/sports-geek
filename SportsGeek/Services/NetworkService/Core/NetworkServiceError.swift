//
//  NetworkServiceError.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import Foundation

enum NetworkServiceError: Error {
    case invalidURL
    case invalidResponse
    case decodingFailed
    case clientError(Int)
    case serverError(Int)
    case unexpectedError
}
