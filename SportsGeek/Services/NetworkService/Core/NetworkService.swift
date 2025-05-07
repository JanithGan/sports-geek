//
//  NetworkService.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Codable>(endpoint: NetworkRequest) async throws -> T
}

final class NetworkService: NetworkServiceProtocol {
    func request<T: Codable>(endpoint: any NetworkRequest) async throws -> T {
        let components = endpoint.buildURLComponents()
        guard let url = components.url else {
            throw NetworkServiceError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.setValue(APIConstants.apiKey, forHTTPHeaderField: "x-api-key")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkServiceError.invalidResponse
        }
//        https://api.sportradar.com/cricket-t2/en/tournaments/sr%3Atournament%3A2472/seasons.json
        
        let statusCode = httpResponse.statusCode
        switch statusCode {
        case 200...299:
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                return decodedResponse
            } catch {
                print("Unknown error:", error)
                throw NetworkServiceError.decodingFailed
            }
        case 400...499:
            throw NetworkServiceError.clientError(statusCode)
        case 500...599:
            throw NetworkServiceError.serverError(statusCode)
        default:
            throw NetworkServiceError.unexpectedError
        }
    }
}
