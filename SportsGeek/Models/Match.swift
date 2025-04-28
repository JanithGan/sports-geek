//
//  Tournament.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-27.
//

import Foundation

struct Match: Identifiable, Codable {
    var id: String
    var team1: String
    var team2: String
    var date: String
    var venue: String
}
