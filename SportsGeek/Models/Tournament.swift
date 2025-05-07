//
//  Tournament.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-21.
//

import Foundation

struct Tournament: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let sportId: SportType
}
