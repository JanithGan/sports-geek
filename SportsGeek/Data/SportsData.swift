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
            imageName: "cricket_image.png", 
            description: "A bat-and-ball game loved across continents."
        ),
        Sport(
            id: .football,
            name: "Football",
            icon: "soccerball", 
            imageName: "football_image.png", 
            description: "Most popular sport worldwide."
        ),
        Sport(
            id: .basketball,
            name: "Basketball",
            icon: "basketball", 
            imageName: "basketball_image.png", 
            description: "Fast-paced team sport with a global fan base."
        )
    ]
}
