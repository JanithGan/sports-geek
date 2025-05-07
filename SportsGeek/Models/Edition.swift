//
//  Edition.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-07.
//

struct Edition: Identifiable {
    let id: String
    let tournamentId: String
    let name: String
    
    let startDate: String
    let endDate: String
    let year: String
    let host: String
    let wonBy: String
}
