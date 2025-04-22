//
//  SportRepository.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-04-22.
//

import Foundation

// Protocol for abstraction
protocol SportRepositoryProtocol {
    func getAllSports() -> [Sport]
}

// Static implementation for now
struct SportRepository: SportRepositoryProtocol {
    func getAllSports() -> [Sport] {
        return SportsData.sports
    }
}
