//
//  SeasonListResponseDTO.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-07.
//

import Foundation

extension Array where Element == EditionDTO {
    func mapToList(tournamentId: String) -> [Edition] {
        return self.map { dto in
            Edition(
                id: dto.id,
                tournamentId: tournamentId,
                name: dto.name,
                startDate: dto.startDate,
                endDate: dto.endDate,
                year: dto.year
            )
        }
    }
}

struct SeasonListResponseDTO: Codable {
    let generatedAt: String
    let tournament: TournamentDTOV2
    let seasons: [EditionDTO]

    enum CodingKeys: String, CodingKey {
        case generatedAt = "generated_at"
        case tournament
        case seasons
    }
}

struct TournamentDTOV2: Codable {
    let id: String
    let name: String
    let type: String?
    let gender: String?
    let sport: SportDTOV2
    let category: CategoryDTOV2
}

struct SportDTOV2: Codable {
    let id: String
    let name: String
}

struct CategoryDTOV2: Codable {
    let id: String
    let name: String
    let countryCode: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case countryCode = "country_code"
    }
}

struct EditionDTO: Codable, Identifiable {
    let id: String
    let name: String
    let startDate: String
    let endDate: String
    let year: String

    enum CodingKeys: String, CodingKey {
        case id, name, year
        case startDate = "start_date"
        case endDate = "end_date"
    }
}
