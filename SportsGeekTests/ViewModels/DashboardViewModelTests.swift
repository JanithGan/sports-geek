//
//  DashboardViewModelTests.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-07.
//

@testable import SportsGeek
import XCTest

final class MockSportRepository: SportRepositoryProtocol {
    var sportsToReturn: [Sport] = []

    func getAllSports() -> [Sport] {
        return sportsToReturn
    }

    func getSport(by id: SportType) -> Sport? {
        return sportsToReturn.first { $0.id == id }
    }
}

final class DashboardViewModelTests: XCTestCase {
    
    func testLoadSports_setsPublishedSportsCorrectly() {
        let mockRepository = MockSportRepository()
        let expectedSports = [
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
        ]
        mockRepository.sportsToReturn = expectedSports

        let viewModel = DashboardViewModel(repository: mockRepository)

        XCTAssertEqual(viewModel.sports.count, expectedSports.count)
        XCTAssertEqual(viewModel.sports.first?.id, .cricket)
        XCTAssertEqual(viewModel.sports.last?.id, .football)
    }
}
