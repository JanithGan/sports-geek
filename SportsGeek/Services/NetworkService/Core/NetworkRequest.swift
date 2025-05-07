//
//  NetworkRequest.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import Foundation

protocol NetworkRequest {
    var path: String { get }
    var pathParams: [String: String] { get }
    var parameteres: [URLQueryItem] { get }
    var method: NetworkMethod { get }
}

extension NetworkRequest {
    func resolvedPath() -> String {
        var resolved = path
        for (key, value) in pathParams {
            resolved = resolved.replacingOccurrences(of: "{\(key)}", with: value)
        }
        return resolved
    }
    
    func buildURLComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = NetworkScheme.https.rawValue
        components.host = APIConstants.baseURLString
        components.path = resolvedPath()
        components.queryItems = parameteres
        return components
    }
}
