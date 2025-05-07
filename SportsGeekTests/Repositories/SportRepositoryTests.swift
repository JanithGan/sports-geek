//
//  TournamentRepository.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-06.
//

import XCTest
@testable import SportsGeek

final class SportRepositoryTests: XCTestCase {
    
    var repository: SportRepository!
    
    override func setUp() {
        super.setUp()
        repository = SportRepository()
    }
    
    override func tearDown() {
        repository = nil
        super.tearDown()
    }
    
    func testGetAllSportsReturnsExpectedCount() {
        let sports = repository.getAllSports()
        XCTAssertFalse(sports.isEmpty, "Expected non-empty sports array.")
    }
    
    func testGetSportByIdReturnsCorrectSport() {
        let knownSportId: SportType = .cricket
        let sport = repository.getSport(by: knownSportId)
        
        XCTAssertNotNil(sport, "Expected to find a sport with id \(knownSportId).")
        XCTAssertEqual(sport?.id, knownSportId, "Returned sport ID should match the query.")
    }
}
