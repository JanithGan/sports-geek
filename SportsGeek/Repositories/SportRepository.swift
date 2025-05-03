//
//  SportRepository.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-04-22.
//

import Foundation

protocol SportRepositoryProtocol {
    func getAllSports() -> [Sport]
    func getSport(by id: SportType) -> Sport?
}

struct SportRepository: SportRepositoryProtocol {
    func getAllSports() -> [Sport] {
        return SportsData.sports
    }
    
    func getSport(by id: SportType) -> Sport? {
        SportsData.sports.first { $0.id == id }
    }
}
