//
//  SportOverviewViewModel.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-21.
//

class SportOverviewViewModel: ObservableObject {
    @Published var tournaments: [Tournament] = []
    @Published var teams: [Team] = []
    @Published var players: [Player] = []

    @Published var isTournamentsExpanded = false
    @Published var isTeamsExpanded = false
    @Published var isPlayersExpanded = false

    let repository = SportOverviewRepository()

    func fetchAll(for sportID: String) {
        repository.getTournaments(for: sportID) { self.tournaments = $0 }
        repository.getTeams(for: sportID) { self.teams = $0 }
        repository.getPlayers(for: sportID) { self.players = $0 }
    }
}
