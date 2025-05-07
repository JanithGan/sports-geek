//
//  Tournament.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-27.
//

import Foundation

struct Series: Identifiable, Codable {
    var id: String
    var name: String
    var startDate: String
    var endDate: String
    var year:String
    var host: String
    var wonBy: String
}
