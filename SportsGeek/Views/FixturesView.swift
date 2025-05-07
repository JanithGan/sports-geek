//
//  FixturesView.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-07.
//

import SwiftUI

struct FixturesView: View {
    let tournament: Tournament
    let edition: Edition
    
    @StateObject private var viewModel: FixturesViewModel
    
    init(tournament: Tournament, edition: Edition) {
        self.tournament = tournament
        self.edition = edition
        _viewModel = StateObject(wrappedValue: FixturesViewModel(
        ))
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment:.leading, spacing: 12) {
                    VStack(alignment:.leading, spacing: 12) {
                        Text(tournament.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text(edition.year)
                            .font(.title3)
                            .foregroundColor(.secondary)
                        
                        if viewModel.fixturesState.isLoading {
                            VStack(spacing: -8) {
                                ForEach(0..<3, id: \.self) { _ in
                                    CardView(heading: "", infoItems: [], isLoading: true)
                                }
                            }
                            .frame(minHeight: geometry.size.height * 0.7)
                            .frame(maxWidth: .infinity, alignment: .center)
                        } else if let error = viewModel.fixturesState.errorMessage {
                            VStack {
                                Text(error)
                                    .foregroundColor(.red)
                                    .multilineTextAlignment(.center)
                                    .padding(.vertical)
                            }
                            .frame(minHeight: geometry.size.height * 0.7)
                            .frame(maxWidth: .infinity, alignment: .center)
                        } else if viewModel.fixturesState.items.isEmpty {
                            VStack {
                                Text("No data found")
                                    .foregroundColor(.gray)
                                    .padding(.vertical)
                            }
                            .frame(minHeight: geometry.size.height * 0.7)
                            .frame(maxWidth: .infinity, alignment: .center)
                        } else {
                            VStack(spacing: 16) {
                                ForEach(viewModel.fixturesState.items) { fixture in
                                    CardView(
                                        heading: fixture.name,
                                        infoItems: [
                                            ("Date", fixture.date),
                                            ("Venue", fixture.venue),
                                            ("Won By", fixture.wonBy)
                                        ],
                                        tint: .blue
                                    )
                                }
                            }
                            
                        }
                    }
                    .frame(minHeight: geometry.size.height, alignment: .top)
                }
            }
            .padding()
            .navigationTitle("Editions")
        }
    }
}

#Preview {
    FixturesView(tournament: Tournament(
        id: "sr:tournament:2472",
        name: "Indian Premier League",
        sportId: .cricket
    ), edition: Edition(
        id: "sr:edition:2472:2023",
        tournamentId: "sr:tournament:2472",
        name: "2023 Indian Premier League",
        startDate: "2023-03-21",
        endDate: "2023-05-29",
        year: "2023"
    ))
}
