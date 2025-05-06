//
//  SportOverviewViewModel.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-21.
//

import Foundation

final class SportOverviewViewModel: ObservableObject {
    @Published var tournaments: [Tournament] = []
    @Published var teams: [Team] = []
    @Published var players: [Player] = []
    @Published var sport: Sport?
    @Published var isTournamentsExpanded = false
    @Published var isTeamsExpanded = false
    @Published var isPlayersExpanded = false

    let repository = SportOverviewRepository()

    private let sportRepository: SportRepositoryProtocol
    private let tournamentRepository: TournamentRepositoryProtocol

    init(id: SportType,
         sportRepository: SportRepositoryProtocol = SportRepository(),
         tournamentRepository: TournamentRepositoryProtocol = TournamentRepository()
    ) {
        self.sportRepository = sportRepository
        self.tournamentRepository = tournamentRepository
        loadData(id: id)
    }

    private func loadData(id: SportType) {
        sport = sportRepository.getSport(by: id)
        Task {
            await fetchTournaments(for: id)
        }
    }

    func fetchTournaments(for id: SportType) async {
        do {
            let data = try await tournamentRepository.getTournaments(for: id)
            self.tournaments = data
        } catch { }
    }    

    func fetchAll(for sportID: String) {
        repository.getTournaments(for: sportID) { self.tournaments = $0 }
        repository.getTeams(for: sportID) { self.teams = $0 }
        repository.getPlayers(for: sportID) { self.players = $0 }
    }
}