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
            icon: "figure.cricket"
        ),
        Sport(
            id: .football,
            name: "Football",
            icon: "soccerball"
        )
    ]
}
