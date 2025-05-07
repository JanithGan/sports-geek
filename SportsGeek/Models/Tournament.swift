//
//  Tournament.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import Foundation

struct Tournament: Identifiable, Hashable {
    let id: String
    let name: String
    let sportId: SportType
}
