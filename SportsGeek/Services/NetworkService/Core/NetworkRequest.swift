//
//  NetworkRequest.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import Foundation

protocol NetworkRequest {
    var path: String { get }
    var parameteres: [URLQueryItem] { get }
    var method: NetworkMethod { get }
}

extension NetworkRequest {
    func buildURLComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = NetworkScheme.https.rawValue
        components.host = APIConstants.baseURLString
        components.path = path
        components.queryItems = parameteres
        return components
    }
}
