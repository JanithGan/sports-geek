//
//  SportOverviewService.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-22.
//

import Foundation

class SportOverviewService {
    static let shared = SportOverviewService()

    func fetchTournaments(for sportID: String, completion: @escaping ([Tournament]) -> Void) {
        // Simulated API Call
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion([Tournament(id: "1", name: "Champions League"), Tournament(id: "2", name: "World Cup")])
        }
    }

    func fetchTeams(for sportID: String, completion: @escaping ([Team]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion([Team(id: "1", name: "Team A"), Team(id: "2", name: "Team B")])
        }
    }

    func fetchPlayers(for sportID: String, completion: @escaping ([Player]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion([Player(id: "1", name: "Player X"), Player(id: "2", name: "Player Y")])
        }
    }
}