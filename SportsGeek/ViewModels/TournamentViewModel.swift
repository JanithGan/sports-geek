//
//  Tournament.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-27.
//

import Foundation

class TournamentViewModel: ObservableObject {
    @Published var tournaments: [Tournament] = []
    private let tournamentRepository = TournamentRepository()

    func fetchTournaments(id: SportType) async {
        let data = try await tournamentRepository.getTournaments(for: id)
        self.tournaments = data
    }
}
