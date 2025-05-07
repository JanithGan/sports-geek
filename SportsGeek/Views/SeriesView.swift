//
//  Tournament.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-05-02.
//

import SwiftUI

struct SeriesView: View {
    let tournament: Tournament

    let mockSeriesList: [Series] = [
        Series(id: "1", tournamentId: "1", name: "ODI Series Bangladesh vs. Sri Lanka", startDate: "2025-02-21", endDate: "2025-02-28", year: "2025", host: "Sri Lanka", wonBy: "Sri Lanka"),
        Series(id: "2", tournamentId: "1", name: "ODI Series Bangladesh vs. Sri Lanka", startDate: "2024-03-13", endDate: "2024-03-18", year: "2024", host: "Bangladesh", wonBy: "Bangladesh"),
        Series(id: "3", tournamentId: "1", name: "ODI Series Bangladesh vs. Sri Lanka", startDate: "2023-01-05", endDate: "2023-01-10", year: "2023", host: "Sri Lanka", wonBy: "Sri Lanka")
    ]

    var filteredSeries: [Series] {
        mockSeriesList.filter { $0.name.contains(tournament.id) }
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(tournament.name)
                .font(.largeTitle)
                .bold()
                .padding(.top)

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(filteredSeries) { series in
                        NavigationLink(destination: MatchesView(seriesTitle: series.name, year: series.year)) {
                            SeriesCardView(series: series)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview{
    //SeriesView(1)
}
