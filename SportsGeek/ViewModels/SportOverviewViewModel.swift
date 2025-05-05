//
//  SportOverviewViewModel.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import Foundation

final class SportOverviewViewModel: ObservableObject {
    @Published var sport: Sport?
    @Published var tournaments: [Tournament] = []
    @Published var players: [String] = []

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
}
