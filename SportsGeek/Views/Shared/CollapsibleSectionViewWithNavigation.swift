//
//  CollapsibleSectionView.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-05-03.
//

import SwiftUI

struct CollapsibleSectionViewWithNavigation<Item: Identifiable & Hashable, Content: View>: View {
    let title: String
    let items: [Item]
    let isCollapsed: Bool
    let rowContent: (Item) -> Content

    // Default initializer for compatibility
    init(
        title: String,
        items: [Item],
        isCollapsed: Bool,
        rowContent: @escaping (Item) -> Content = { item in
            Text(String(describing: item)) as! Content
        }
    ) {
        self.title = title
        self.items = items
        self.isCollapsed = isCollapsed
        self.rowContent = rowContent
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.headline)

            if !isCollapsed {
                ForEach(items) { item in
                    rowContent(item)
                }
            }
        }
    }
}

