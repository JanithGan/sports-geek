// 
//  SportOverviewRepository.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-22.
//  

class SportOverviewRepository {
    func getTournaments(for sportID: String, completion: @escaping ([Tournament]) -> Void) {
        APIService.shared.fetchTournaments(for: sportID, completion: completion)
    }

    func getTeams(for sportID: String, completion: @escaping ([Team]) -> Void) {
        APIService.shared.fetchTeams(for: sportID, completion: completion)
    }

    func getPlayers(for sportID: String, completion: @escaping ([Player]) -> Void) {
        APIService.shared.fetchPlayers(for: sportID, completion: completion)
    }
}