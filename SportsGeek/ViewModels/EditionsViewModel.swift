//
//  EditionsViewModel.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-07.
//

import Foundation

class EditionsViewModel: ObservableObject {
    @Published var editions: [Edition] = []
    private let repository: TournamentRepositoryProtocol

    init(repository: TournamentRepositoryProtocol = TournamentRepository()) {
        self.repository = repository
        loadSports()
    }

    private func loadSports() {
        editions = repository.getTournamentEditions(for: .cricket, tournamentId: "Tour 1")
    }
}
