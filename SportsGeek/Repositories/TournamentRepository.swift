//
//  TournamentsRepository.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import Foundation

protocol TournamentRepositoryProtocol {
    func getTournaments(for sportId: SportType) -> [Tournament]
}

struct TournamentRepository: TournamentRepositoryProtocol {
    func getTournaments(for sportId: SportType) -> [Tournament] {
        // To be replaced with a service call
        return [Tournament(name: "Tour 1"), Tournament(name: "Tour 2"), Tournament(name: "Tour 3")]
    }
}
