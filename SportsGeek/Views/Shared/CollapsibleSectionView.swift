//
//  CollapsibleSectionView.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import SwiftUI

struct CollapsibleSectionView: View {
    let title: String
    let items: [String]
    @State private var isExpanded = true
    
    init(title: String, items: [String], isCollapsed: Bool = true) {
        self.title = title
        self.items = items
        _isExpanded = State(initialValue: !isCollapsed)
    }

    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            VStack(spacing: 0) {
                ForEach(items.indices, id: \.self) { index in
                    HStack {
                        Text(items[index])
                            .font(.body)
                            .padding(.vertical, 10)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .background(Color(.secondarySystemBackground))

                    if index != items.count - 1 {
                        Divider()
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.top, 8)
        } label: {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.3))
        )
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 1)
    }
}
