//
//  SportOverviewRepositoryTests.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-05-06.
//

import XCTest
@testable import YourAppModuleName

class SportOverviewRepositoryTests: XCTestCase {

    class MockService: SportOverviewServiceProtocol {
        var tournamentsCalled = false
        var teamsCalled = false
        var playersCalled = false

        func fetchTournaments(for sportID: String, completion: @escaping ([Tournament]) -> Void) {
            tournamentsCalled = true
            completion([Tournament(id: "1", name: "Test Tournament")])
        }

        func fetchTeams(for sportID: String, completion: @escaping ([Team]) -> Void) {
            teamsCalled = true
            completion([Team(id: "1", name: "Test Team")])
        }

        func fetchPlayers(for sportID: String, completion: @escaping ([Player]) -> Void) {
            playersCalled = true
            completion([Player(id: "1", name: "Test Player")])
        }
    }

    func testGetTournaments() {
        let mockService = MockService()
        let repo = SportOverviewRepository(service: mockService)

        let expectation = self.expectation(description: "Fetch tournaments")
        repo.getTournaments(for: "cricket") { tournaments in
            XCTAssertTrue(mockService.tournamentsCalled)
            XCTAssertEqual(tournaments.count, 1)
            XCTAssertEqual(tournaments.first?.name, "Test Tournament")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }

    func testGetTeams() {
        let mockService = MockService()
        let repo = SportOverviewRepository(service: mockService)

        let expectation = self.expectation(description: "Fetch teams")
        repo.getTeams(for: "cricket") { teams in
            XCTAssertTrue(mockService.teamsCalled)
            XCTAssertEqual(teams.count, 1)
            XCTAssertEqual(teams.first?.name, "Test Team")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }

    func testGetPlayers() {
        let mockService = MockService()
        let repo = SportOverviewRepository(service: mockService)

        let expectation = self.expectation(description: "Fetch players")
        repo.getPlayers(for: "cricket") { players in
            XCTAssertTrue(mockService.playersCalled)
            XCTAssertEqual(players.count, 1)
            XCTAssertEqual(players.first?.name, "Test Player")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
}
