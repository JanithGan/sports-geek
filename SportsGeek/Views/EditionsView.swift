//
//  Tournament.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-05-03.
//

import SwiftUI

struct EditionsView: View {
    let tournament: Tournament
    
    @StateObject private var viewModel = EditionsViewModel()
    
    init(tournament: Tournament) {
        self.tournament = tournament
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Text(tournament.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ForEach(viewModel.editions) { edition in
                    NavigationLink(destination: MatchesView(seriesTitle: edition.name, year: edition.year)) {
                        //SeriesCardView(series: series)
                        CardView(
                            heading: edition.name,
                            infoItems: [
                                ("Start Date", edition.startDate),
                                ("End Date", edition.endDate),
                                ("Year", edition.year),
                                ("Host", edition.host),
                                ("Won By", edition.wonBy)
                            ],
                            tint: .green
                        )
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Editions")
    }
}

#Preview {
    //EditionsView(tournament: Tournament(id: "1", name: "Tour 1", sportId: .cricket))
}
