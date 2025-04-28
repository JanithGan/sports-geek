//
//  Tournament.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-27.
//

import Foundation

class SeriesViewModel: ObservableObject {
    @Published var seriesList: [Series] = []
    private let repository = TournamentRepository()

    func fetchSeries(forTournamentId id: String) {
        self.seriesList = repository.getSeries(for: id)
    }
}
