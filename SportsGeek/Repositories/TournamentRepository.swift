//
//  TournamentsRepository.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import Foundation

protocol TournamentRepositoryProtocol {
    func getTournaments(for sportId: SportType) async throws -> [Tournament]
    func getTournamentEditions(for sportId: SportType, tournamentId: String) -> [Edition]
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
            tournamentList = response.tournaments.mapToList(sportId: sportId)
        }

        return tournamentList
    }
    
    func getTournamentEditions(for sportId: SportType, tournamentId: String) -> [Edition] {
        // Refactor: fetch from API
        let EditionsList: [Edition] = [
            Edition(
                id: "1",
                tournamentId: "Tour 1",
                name: "Edition 1",
                startDate: "2025-02-21",
                endDate: "2025-02-28",
                year: "2025",
                host: "Sri Lanka",
                wonBy: "Sri Lanka"
            ),
            Edition(
                id: "2",
                tournamentId: "Tour 1",
                name: "Edition 2",
                startDate: "2023-01-02",
                endDate: "2023-01-20",
                year: "2023",
                host: "Australia",
                wonBy: "Australia"
            )]
        
        return EditionsList
    }
    
    func getMatches(for editionId: String) -> [Match] {
        // Refactor: fetch from API
        let matches: [Match] = [
            Match(
                id: "1",
                team1: "Sri Lanka",
                team2: "Bangaladesh",
                date: "2025-02-21",
                venue: "Keththarama Stadium"
            ),
            Match(
                id: "2",
                team1: "India",
                team2: "New Zealand",
                date: "2025-02-23",
                venue: "Dambulla Stadium"
            )]
        
        return matches
    }}
