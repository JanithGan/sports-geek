//
//  EditionsView.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-05-03.
//

import SwiftUI

struct EditionsView: View {
    let tournament: Tournament
    
    @StateObject private var viewModel: EditionsViewModel
    
    init(tournament: Tournament) {
        self.tournament = tournament
        _viewModel = StateObject(wrappedValue: EditionsViewModel(
            sportId: tournament.sportId,
            tournamentId: tournament.id
        ))
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment:.leading, spacing: 12) {
                    Text(tournament.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(24)
                    
                    if viewModel.editionsState.isLoading {
                        VStack(spacing: -8) {
                            ForEach(0..<3, id: \.self) { _ in
                                CardView(heading: "", infoItems: [], isLoading: true)
                            }
                        }
                        .frame(minHeight: geometry.size.height * 0.7)
                        .frame(maxWidth: .infinity, alignment: .center)
                    } else if let error = viewModel.editionsState.errorMessage {
                        VStack {
                            Text(error)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                                .padding(.vertical)
                        }
                        .frame(minHeight: geometry.size.height * 0.7)
                        .frame(maxWidth: .infinity, alignment: .center)
                    } else if viewModel.editionsState.items.isEmpty {
                        VStack {
                            Text("No data found")
                                .foregroundColor(.gray)
                                .padding(.vertical)
                        }
                        .frame(minHeight: geometry.size.height * 0.7)
                        .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        VStack(spacing: 16) {
                            ForEach(viewModel.editionsState.items) { edition in
                                NavigationLink(destination: FixturesView(tournament: tournament, edition: edition)) {
                                    CardView(
                                        heading: edition.name,
                                        infoItems: [
                                            ("Start Date", edition.startDate),
                                            ("End Date", edition.endDate),
                                            ("Year", edition.year)
                                            // ("Host", edition.host),
                                            // ("Won By", edition.wonBy)
                                        ],
                                        tint: .blue
                                    )
                                }
                            }
                        }
                        
                    }
                }
                .frame(minHeight: geometry.size.height, alignment: .top)
            }
        }
        .padding()
        .navigationTitle("Editions")
        .onAppear {
            viewModel.fetchEditions()
        }
    }
}

#Preview {
    EditionsView(tournament: Tournament(
        id: "sr:tournament:2472",
        name: "Indian Premier League",
        sportId: .cricket
    ))
}
