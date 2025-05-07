//
//  ItemsListSectionState.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-06.
//

/// Maintain the state of a section with list of items
struct ItemsListSectionState<T> {
    /// List of items
    var items: [T] = []
    
    /// If items is loading
    var isLoading: Bool = false
    
    /// For items fetch errors
    var errorMessage: String? = nil
}
