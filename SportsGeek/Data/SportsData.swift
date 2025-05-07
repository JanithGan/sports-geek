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
            quote: "Where patience meets power—every ball tells a story."
        ),
        Sport(
            id: .football,
            name: "Football",
            icon: "soccerball",
            themeColor: .blue,
            coverPhoto: "football",
            quote: "One game. One goal. A world united by the pitch."
        ),
        Sport(
            id: .rugby,
            name: "Rugby",
            icon: "rugbyball",
            themeColor: .orange,
            coverPhoto: "rugby",
            quote: "Brutal beauty—where heart, grit, and tackles collide."
        ),
        Sport(
            id: .volleyball,
            name: "Volleyball",
            icon: "volleyball",
            themeColor: .red,
            coverPhoto: "volleyball",
            quote: "Above the net, beneath the pressure—every spike counts."
        ),
        Sport(
            id: .tennis,
            name: "Tennis",
            icon: "tennis.racket",
            themeColor: .purple,
            coverPhoto: "tennis",
            quote: "One court, two minds—precision in every swing."
        ),
        Sport(
            id: .hockey,
            name: "Hockey",
            icon: "hockey.puck",
            themeColor: .cyan,
            coverPhoto: "hockey",
            quote: "Fast sticks, sharp plays—where control commands the turf."
        )
    ]
}
