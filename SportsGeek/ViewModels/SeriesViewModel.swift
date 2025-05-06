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

    func fetchSeries(forTournamentId tournamentId: String) {
        // Mock data
        let mockSeries = [
            Series(id: "1", name: "World Cup 2024", startDate: "2024-06-01", endDate: "2024-07-15", host: "India", wonBy: "Australia"),
            Series(id: "2", name: "World Cup 2020", startDate: "2020-06-01", endDate: "2020-07-15", host: "England", wonBy: "India"),
            Series(id: "3", name: "World Cup 2016", startDate: "2016-06-01", endDate: "2016-07-15", host: "Australia", wonBy: "West Indies")
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.seriesList = mockSeries
        }
    }
}
