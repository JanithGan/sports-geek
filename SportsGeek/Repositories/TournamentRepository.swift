//
//  TournamentsRepository.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import Foundation

protocol TournamentRepositoryProtocol {
    func getTournaments(for sportId: SportType) async throws -> [Tournament]
}

struct TournamentRepository: TournamentRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func getTournaments(for sportId: SportType) async throws -> [Tournament] {
        var tournamentList: [Tournament] = []
        
        // Fetch request
        var request: TournamentListRequest?
        switch sportId {
        case .cricket:
            request = TournamentListRequest.cricket
        default:
            break
        }
        
        // Send request
        if let request = request {
            let response: TournamentListResponseDTO = try await networkService.request(endpoint: request)
            tournamentList = response.tournaments.mapToList()
        }

        return tournamentList
    }
}
