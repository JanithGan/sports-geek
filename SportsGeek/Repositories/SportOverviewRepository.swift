// 
//  SportOverviewRepository.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-22.
//  
 
import Foundation

class SportOverviewRepository {
    func getTournaments(for sportID: String, completion: @escaping ([Tournament]) -> Void) {
        SportOverviewService.shared.fetchTournaments(for: sportID, completion: completion)
    }

    func getTeams(for sportID: String, completion: @escaping ([Team]) -> Void) {
        SportOverviewService.shared.fetchTeams(for: sportID, completion: completion)
    }

    func getPlayers(for sportID: String, completion: @escaping ([Player]) -> Void) {
        SportOverviewService.shared.fetchPlayers(for: sportID, completion: completion)
    }
}