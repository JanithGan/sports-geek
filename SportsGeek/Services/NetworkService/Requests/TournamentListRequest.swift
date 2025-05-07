//
//  TournamentListRequest.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import Foundation

enum TournamentListRequest {
    case cricket
}

extension TournamentListRequest: NetworkRequest {
    var baseURL: String {
        return APIConstants.baseURLString
    }
    
    var path: String {
        switch self {
        case .cricket:
            return "/cricket-t2/en/tournaments.json"
        }
    }
    
    var pathParams: [String : String] {
        switch self {
        case .cricket:
            let params: [String : String] = [:]
            return params
        }
    }
    
    var parameteres: [URLQueryItem] {
        switch self {
        case .cricket:
            let params: [URLQueryItem] = []
            return params
        }
    }
    
    var method: NetworkMethod {
        .get
    }
}
