//
//  SportOverviewView.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-02.
//

import SwiftUI

struct SportOverviewView: View {
    let sportId: SportType
    @StateObject private var viewModel: SportOverviewViewModel

    init(sportId: SportType) {
        self.sportId = sportId
        _viewModel = StateObject(wrappedValue: SportOverviewViewModel(id: sportId))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let sport = viewModel.sport {
                    Text(sport.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)

                    VStack(alignment: .leading, spacing: 12) {
                        GeometryReader { geometry in
                            Image(sport.coverPhoto)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: 200)
                                .clipped()
                                .cornerRadius(12)
                        }
                        .frame(height: 200)
                        .padding(.horizontal)
                        
                        Text("“\(sport.quote)”")
                                .font(.body)
                                .foregroundColor(.secondary)
                                .padding(.horizontal)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(sport.themeColor.opacity(0.8), lineWidth: 1)
                    )
                    .background(Color(.systemBackground))
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)

                    // Tournaments Section
                    CollapsibleSectionViewWithNavigation(
                        title: "Tournaments", 
                        items: viewModel.tournaments.map { $0.name }, 
                        isCollapsed: false
                    ) { tournament in
                        AnyView(
                            NavigationLink(destination: SeriesView(tournamentName: tournament.id)) {
                                Text(tournament.name)
                                    .padding(.leading)
                            }
                        )
                    }

                    // Players Section
                    CollapsibleSectionView(title: "Players", items: viewModel.players)
                }
            }
            .padding()
        }
        .navigationTitle("Overview")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SportOverviewView(sportId: .cricket)
}
