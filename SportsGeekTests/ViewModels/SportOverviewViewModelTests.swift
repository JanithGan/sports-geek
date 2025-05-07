//
//  DashboardViewModelTests.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-05-06.
//

import XCTest
@testable import YourProjectName

final class SportOverviewViewModelTests: XCTestCase {
    
    // MARK: - Mocks
    class MockSportRepository: SportRepositoryProtocol {
        func getAllSports() -> [Sport] {
            return [Sport(id: .cricket, name: "Cricket", icon: "🏏", themeColor: .blue)]
        }

        func getSport(by id: SportType) -> Sport? {
            return getAllSports().first { $0.id == id }
        }
    }

    class MockTournamentRepository: TournamentRepositoryProtocol {
        func getTournaments(for sportID: SportType) async throws -> [Tournament] {
            return [
                Tournament(id: "1", name: "Asia Cup", category: "International", gender: "Male"),
                Tournament(id: "2", name: "World Cup", category: "International", gender: "Male")
            ]
        }
    }

    // MARK: - Tests

    func testInit_LoadsSportCorrectly() {
        let viewModel = SportOverviewViewModel(
            id: .cricket,
            sportRepository: MockSportRepository(),
            tournamentRepository: MockTournamentRepository()
        )

        XCTAssertNotNil(viewModel.sport)
        XCTAssertEqual(viewModel.sport?.id, .cricket)
    }

    func testFetchTournaments_Success() async {
        let viewModel = SportOverviewViewModel(
            id: .cricket,
            sportRepository: MockSportRepository(),
            tournamentRepository: MockTournamentRepository()
        )

        await viewModel.fetchTournaments()

        XCTAssertFalse(viewModel.tournamentsState.isLoading)
        XCTAssertEqual(viewModel.tournamentsState.items.count, 2)
        XCTAssertEqual(viewModel.tournamentsState.items.first?.name, "Asia Cup")
    }
}
