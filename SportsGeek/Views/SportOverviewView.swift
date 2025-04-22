//
//  SportOverviewView.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-20.
//

struct SportOverviewView: View {
    let sportID: String
    @StateObject private var viewModel = SportOverviewViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Sport info card
                if let sport = SportData.sport(for: sportID) {
                    SportOverviewDescriptionCard(imageName: sport.imageName, title: sport.name, description: sport.description)
                }

                // Expandable sections
                SportOverviewExpandableCard(title: "Tournaments", isExpanded: $viewModel.isTournamentsExpanded) {
                    ForEach(viewModel.tournaments) { tournament in
                        Text(tournament.name)
                            .padding(.leading)
                    }
                }

                SportOverviewExpandableCard(title: "Teams", isExpanded: $viewModel.isTeamsExpanded) {
                    ForEach(viewModel.teams) { team in
                        Text(team.name)
                            .padding(.leading)
                    }
                }

                SportOverviewExpandableCard(title: "Players", isExpanded: $viewModel.isPlayersExpanded) {
                    ForEach(viewModel.players) { player in
                        Text(player.name)
                            .padding(.leading)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchAll(for: sportID)
        }
    }
}