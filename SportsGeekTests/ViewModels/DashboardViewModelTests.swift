//
//  DashboardViewModelTests.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-05-06.
//

import XCTest
@testable import YourAppModuleName

final class DashboardViewModelTests: XCTestCase {
    
    class MockSportRepository: SportRepositoryProtocol {
        func getAllSports() -> [Sport] {
            return [
                Sport(id: .cricket, name: "Cricket", themeColor: .blue),
                Sport(id: .football, name: "Football", themeColor: .green)
            ]
        }

        func getSport(by id: SportType) -> Sport? {
            return getAllSports().first { $0.id == id }
        }
    }

    func testDashboardViewModelLoadsSports() {
        let mockRepository = MockSportRepository()
        let viewModel = DashboardViewModel(repository: mockRepository)

        XCTAssertEqual(viewModel.sports.count, 2)
        XCTAssertEqual(viewModel.sports[0].name, "Cricket")
        XCTAssertEqual(viewModel.sports[1].name, "Football")
    }
}
