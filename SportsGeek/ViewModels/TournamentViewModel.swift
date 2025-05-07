//
//  Tournament.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-27.
//

import Foundation

class TournamentViewModel: ObservableObject {
    @Published var tournaments: [Tournament] = []
    private let repository = TournamentRepository()

    func fetchTournaments(sportId: SportType) {
        self.tournaments = repository.getTournaments(for: sportID)
    }
}
