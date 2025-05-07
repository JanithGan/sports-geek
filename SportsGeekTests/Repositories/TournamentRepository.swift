//
//  TournamentRepository.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-06.
//

import XCTest
@testable import SportsGeek // Replace with your actual module name

final class SportRepositoryTests: XCTestCase {
    var repository: SportRepositoryProtocol!

    override func setUp() {
        super.setUp()
        repository = SportRepository()
    }

    override func tearDown() {
        repository = nil
        super.tearDown()
    }

    func testGetAllSportsReturnsNonEmptyList() {
        let sports = repository.getAllSports()
        XCTAssertFalse(sports.isEmpty, "Expected non-empty list of sports")
    }

    func testGetSportByIdReturnsCorrectSport() {
        let expectedSport = SportsData.sports.first!
        let fetchedSport = repository.getSport(by: expectedSport.id)
        XCTAssertEqual(fetchedSport?.id, expectedSport.id, "Expected sport with matching ID")
        XCTAssertEqual(fetchedSport?.name, expectedSport.name, "Expected sport with matching name")
    }
}
