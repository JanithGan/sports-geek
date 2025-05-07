//
//  EditionsViewModel.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-07.
//

import Foundation

@MainActor
final class EditionsViewModel: ObservableObject {
    private final let MAX_EDITIONS_COUNT: Int = 10
    
    @Published var editionsState = ItemsListSectionState<Edition>()
    
    private let sportId: SportType
    private let tournamentId: String
    private let tournamentRepository: TournamentRepositoryProtocol
    
    init(sportId: SportType,
         tournamentId: String,
         tournamentRepository: TournamentRepositoryProtocol = TournamentRepository()
    ) {
        self.sportId = sportId
        self.tournamentId = tournamentId
        self.tournamentRepository = tournamentRepository
    }
    
    /// Fetch editions for the given sport
    func fetchEditions() {
        editionsState.isLoading = true
        
        Task {
            do {
                let allEditions = try await tournamentRepository.getTournamentEditions(for: sportId, tournamentId: tournamentId)
                
                // Switch to the main thread before updating the UI
                DispatchQueue.main.async {
                    self.editionsState.items = Array(allEditions.prefix(self.MAX_EDITIONS_COUNT)) // Limit items
                    self.editionsState.isLoading = false
                }
            } catch {
                // Handle error and switch to the main thread for error handling
                DispatchQueue.main.async {
                    self.editionsState.errorMessage = "Failed to load editions: \(error.localizedDescription)"
                    self.editionsState.isLoading = false
                }
            }
        }
    }
}
