//
//  SeasonListRequest.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-07.
//

import Foundation

enum SeasonListRequest {
    case cricket(tournamentId: String)
}

extension SeasonListRequest: NetworkRequest {
    var baseURL: String {
        return APIConstants.baseURLString
    }
    
    var path: String {
        switch self {
        case .cricket:
            return "/cricket-t2/en/tournaments/{tournament_id}/seasons.json"
        }
    }
    
    var pathParams: [String : String] {
        switch self {
        case .cricket(let tournamentId):
            let params = [
                "tournament_id": tournamentId
            ]
            
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
