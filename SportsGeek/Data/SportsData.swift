//
//  SportsData.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-04-22.
//

import Foundation

struct SportsData {
    static let sports: [Sport] = [
        Sport(
            id: .cricket,
            name: "Cricket",
            icon: "figure.cricket",
            themeColor: .green,
            coverPhoto: "cricket",
            quote: "Where patience meets power—every ball tells a story.",
            imageName: "cricket_image.png", 
            description: "A bat-and-ball game loved across continents."
        ),
        Sport(
            id: .football,
            name: "Football",
            icon: "soccerball",
            themeColor: .blue,
            coverPhoto: "football",
            quote: "One game. One goal. A world united by the pitch.", 
            imageName: "football_image.png", 
            description: "Most popular sport worldwide."
        ),
        Sport(
            id: .basketball,
            name: "Basketball",
            icon: "basketball", 
            themeColor: .green,
            coverPhoto: "basketball",
            quote: "Talent wins games, but teamwork and intelligence wins championships.", 
            imageName: "basketball_image.png", 
            description: "Fast-paced team sport with a global fan base."
        ),
        Sport(
            id: .rugby,
            name: "Rugby",
            icon: "rugbyball",
            themeColor: .orange,
            coverPhoto: "rugby",
            quote: "Brutal beauty—where heart, grit, and tackles collide.", 
            imageName: "rugby_image.png", 
            description: "Most popular sport worldwide."
        ),
        Sport(
            id: .volleyball,
            name: "Volleyball",
            icon: "volleyball",
            themeColor: .red,
            coverPhoto: "volleyball",
            quote: "Above the net, beneath the pressure—every spike counts.", 
            imageName: "volleyball_image.png", 
            description: "Most popular sport worldwide."
        ),
        Sport(
            id: .tennis,
            name: "Tennis",
            icon: "tennis.racket",
            themeColor: .purple,
            coverPhoto: "tennis",
            quote: "One court, two minds—precision in every swing.", 
            imageName: "tennis_image.png", 
            description: "Most popular sport worldwide."
        ),
        Sport(
            id: .hockey,
            name: "Hockey",
            icon: "hockey.puck",
            themeColor: .cyan,
            coverPhoto: "hockey",
            quote: "Fast sticks, sharp plays—where control commands the turf.", 
            imageName: "hockey_image.png", 
            description: "Most popular sport worldwide."
        )
    ]
}
