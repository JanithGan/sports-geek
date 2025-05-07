//
//  FixturesView.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-05-03.
//

import SwiftUI

struct FixturesView: View {
    let tournament: Tournament
    let edition: Edition

    var body: some View {
        VStack(alignment:.leading, spacing: 12) {
            Text(tournament.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(edition.year)
                .font(.title3)
                .foregroundColor(.secondary)

            Spacer()
            
            UpcomingFeatureView()
            
            Spacer()
        }
        .padding(32)
        .navigationTitle("Fixtures")
    }
}

#Preview {
    // FixturesView(tournament: Tournament(
    //     id: "sr:tournament:2472",
    //     name: "Indian Premier League",
    //     sportId: .cricket
    // ), edition: Edition(
    //     id: "sr:edition:2472:2023",
    //     tournamentId: "sr:tournament:2472",
    //     name: "2023 Indian Premier League",
    //     startDate: "2023-03-21",
    //     endDate: "2023-05-29",
    //     year: "2023"
    // ))
}
