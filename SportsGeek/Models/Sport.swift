//
//  Sport.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-04-21.
//

import Foundation

struct Sport: Identifiable {
    let id: SportType
    let name: String
    let icon: String // SF Symbol name
}

enum SportType {
    case cricket
    case football
}
