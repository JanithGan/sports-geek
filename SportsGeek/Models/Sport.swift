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
    let imageName: String // Image name in assets
    let description: String
}

enum SportType {
    case cricket
    case football
    case basketball
    case baseball
    case tennis
    case hockey
    case rugby
    case golf
    case swimming
    case athletics
    case esports
    case cycling
    case motorsport
    case wrestling
    case boxing
    case badminton
    case volleyball
    case tableTennis
    case handball
    case squash
}
