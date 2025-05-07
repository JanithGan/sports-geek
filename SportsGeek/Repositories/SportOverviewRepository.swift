// 
//  SportOverviewRepository.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-22.
//  
 
import Foundation

class SportOverviewRepository {
    private let service: SportOverviewServiceProtocol

    init(service: SportOverviewServiceProtocol = SportOverviewService.shared) {
        self.service = service
    }

    func getTournaments(for sportID: String, completion: @escaping ([Tournament]) -> Void) {
        service.fetchTournaments(for: sportID, completion: completion)
    }

    func getTeams(for sportID: String, completion: @escaping ([Team]) -> Void) {
        service.fetchTeams(for: sportID, completion: completion)
    }

    func getPlayers(for sportID: String, completion: @escaping ([Player]) -> Void) {
        service.fetchPlayers(for: sportID, completion: completion)
    }
}