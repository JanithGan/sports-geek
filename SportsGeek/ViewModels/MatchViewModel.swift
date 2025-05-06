//
//  Tournament.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-27.
//

import Foundation

class MatchViewModel: ObservableObject {
    @Published var matches: [Match] = []
    private let repository = TournamentRepository()

    func fetchMatches(forSeriesId id: String) {
        self.matches = repository.getMatches(for: id)
    }
}
