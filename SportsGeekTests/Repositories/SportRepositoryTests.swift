//
//  SportRepositoryTests.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-05-06.
//

import XCTest
@testable import YourAppModuleName

final class SportRepositoryTests: XCTestCase {
    
    // Mock data for test
    struct MockSportsData {
        static let sports: [Sport] = [
            Sport(id: .cricket, name: "Cricket", themeColor: .blue),
            Sport(id: .football, name: "Football", themeColor: .green)
        ]
    }

    // Override the static data if needed
    override class func setUp() {
        super.setUp()
        SportsData.sports = MockSportsData.sports
    }

    func testGetAllSports_returnsCorrectList() {
        let repository = SportRepository()
        let sports = repository.getAllSports()

        XCTAssertEqual(sports.count, 2)
        XCTAssertEqual(sports[0].name, "Cricket")
        XCTAssertEqual(sports[1].name, "Football")
    }

    func testGetSport_validId_returnsCorrectSport() {
        let repository = SportRepository()
        let sport = repository.getSport(by: .cricket)

        XCTAssertNotNil(sport)
        XCTAssertEqual(sport?.name, "Cricket")
    }

    func testGetSport_invalidId_returnsNil() {
        let repository = SportRepository()
        let sport = repository.getSport(by: .tennis) // Assuming .tennis is not in mock

        XCTAssertNil(sport)
    }
}
