//
//  Environment.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-05.
//

import Foundation

/// Fetch configuration from `Info.plist`.
public class Environment {
    /// Get configs as a dictionary
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Config file not found")
        }
        return dict
    }()
    
    /// Enum for keys in config file
    public enum Keys: String {
        case baseURL = "BASE_URL"
        case apiKey = "API_KEY"
    }
    
    /// Get config value
    public static func getValue(_ key: Keys) -> String {
        guard let value = Bundle.main.infoDictionary?[key.rawValue] as? String else {
            fatalError("\(key.rawValue) not set in plist")
        }
        return value
    }
}
