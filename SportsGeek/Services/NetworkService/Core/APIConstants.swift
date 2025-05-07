//
//  APIConstants.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import Foundation

struct APIConstants {
    static let baseURLString = Environment.getValue(.baseURL)
    static let apiKey = Environment.getValue(.apiKey)
}
