//
//  FixturesViewModel.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-07.
//

import Foundation

class FixturesViewModel: ObservableObject {
    @Published var fixturesState = ItemsListSectionState<Fixture>()
    
    init() {
        fetchFixtures()
    }
    
    func fetchFixtures(){
        // For testing
//        fixturesState.items = [
//            Fixture(
//                id: "1",
//                name: "ODI Series Bangladesh vs. Sri Lanka 2025 - Match 1",
//                date: "2025-02-21",
//                venue: "Rangiri Dambulla Stadium",
//                wonBy: "Sri Lanka"
//            )]
    }
}
