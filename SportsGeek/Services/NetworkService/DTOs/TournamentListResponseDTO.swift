//
//  TournamentListResponseDTO.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import Foundation

extension Array where Element == TournamentDTO {
    func mapToList(sportId: SportType) -> [Tournament] {
        return self.map { dto in
            Tournament(id: dto.id, name: dto.name, sportId: sportId)
        }
    }
}

struct TournamentListResponseDTO: Codable {
    let generatedAt: String
    let tournaments: [TournamentDTO]

    enum CodingKeys: String, CodingKey {
        case generatedAt = "generated_at"
        case tournaments
    }
}

struct TournamentDTO: Codable {
    let id: String
    let name: String
    let type: String?
    let gender: String?
    let sport: SportDTO
    let category: CategoryDTO
    let currentSeason: SeasonDTO

    enum CodingKeys: String, CodingKey {
        case id, name, type, gender, sport, category
        case currentSeason = "current_season"
    }
}

struct SportDTO: Codable {
    let id: String
    let name: String?
}

struct CategoryDTO: Codable {
    let id: String
    let name: String?
}

struct SeasonDTO: Codable {
    let id: String
    let name: String?
    let startDate: String?
    let endDate: String?
    let year: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case startDate = "start_date"
        case endDate = "end_date"
        case year
    }
}
