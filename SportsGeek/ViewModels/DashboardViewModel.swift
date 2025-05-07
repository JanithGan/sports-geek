//
//  DashboardViewModel.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-04-21.
//

import Foundation

class DashboardViewModel: ObservableObject {
    @Published var sports: [Sport] = []
    private let repository: SportRepositoryProtocol

    init(repository: SportRepositoryProtocol = SportRepository()) {
        self.repository = repository
        loadSports()
    }

    private func loadSports() {
        sports = repository.getAllSports()
    }
}
