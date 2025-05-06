//
//  Sport.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-04-21.
//

import SwiftUI

struct Sport: Identifiable {
    let id: SportType
    let name: String
    let icon: String // SF Symbol name
    let themeColor: Color
    let coverPhoto: String
    let quote: String
    let imageName: String // Image name in assets
    let description: String
}

enum SportType {
    case cricket
    case football
    case rugby
    case volleyball
    case tennis
    case hockey
    case basketball
    case baseball
    case golf
    case swimming
    case athletics
    case esports
    case cycling
    case motorsport
    case wrestling
    case boxing
    case badminton
    case tableTennis
    case handball
    case squash
}
