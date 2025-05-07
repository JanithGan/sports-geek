//
//  SportOverviewViewModel.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import Foundation

@MainActor
final class SportOverviewViewModel: ObservableObject {
    private final let MAX_TOURNAMENTS_COUNT: Int = 10
    
    @Published var sport: Sport?
    @Published var tournaments: [Tournament] = []
    @Published var players: [Player] = []
    @Published var selectedTournament: Tournament?
    
    @Published var tournamentsState = ItemsListSectionState<Tournament>()
    
    private let sportId: SportType
    private let sportRepository: SportRepositoryProtocol
    private let tournamentRepository: TournamentRepositoryProtocol
    
    init(id: SportType,
         sportRepository: SportRepositoryProtocol = SportRepository(),
         tournamentRepository: TournamentRepositoryProtocol = TournamentRepository()
    ) {
        self.sportRepository = sportRepository
        self.tournamentRepository = tournamentRepository
        self.sportId = id
        
        loadData(id: id)
    }
    
    private func loadData(id: SportType) {
        sport = sportRepository.getSport(by: id)
    }
    
    /// Fetch Tournaments for the given sport
    func fetchTournaments() {
        tournamentsState.isLoading = true
        
        Task {
            do {
                let allTournaments = try await tournamentRepository.getTournaments(for: sportId)
                
                // Switch to the main thread before updating the UI
                DispatchQueue.main.async {
                    self.tournamentsState.items = Array(allTournaments.prefix(self.MAX_TOURNAMENTS_COUNT))  // Limit to 10 tournaments
                    self.tournamentsState.isLoading = false
                }
            } catch {
                // Handle error and switch to the main thread for error handling
                DispatchQueue.main.async {
                    self.tournamentsState.errorMessage = "Failed to load tournaments: \(error.localizedDescription)"
                    self.tournamentsState.isLoading = false
                }
            }
        }
    }
    
    func navigateToTournament(_ tournament: Tournament) {
        selectedTournament = tournament
    }
}
