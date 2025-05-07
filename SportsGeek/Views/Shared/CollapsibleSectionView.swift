//
//  CollapsibleSectionView.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import SwiftUI

struct CollapsibleSectionView<T: Identifiable & Hashable, Destination: View>: View {
    let title: String
    let tint: Color
    let items: [T]
    
    let isUpcoming: Bool
    let isCollapsed: Bool
    let isLoading: Bool
    let errorMessage: String?
    
    let display: (T) -> String
    let destination: (T) -> Destination?
    
    @State private var isExpanded: Bool
    @State private var selectedItem: T? = nil
    
    init(
        title: String,
        tint: Color = .secondary,
        items: [T],
        isUpcoming: Bool = false,
        isCollapsed: Bool = true,
        isLoading: Bool = false,
        errorMessage: String? = nil,
        display: @escaping (T) -> String,
        destination: @escaping (T) -> Destination?
    ) {
        self.title = title
        self.tint = tint
        self.items = items
        
        self.isUpcoming = isUpcoming
        self.isCollapsed = isCollapsed
        self.isLoading = isLoading
        self.errorMessage = errorMessage
        
        self.display = display
        self.destination = destination
        _isExpanded = State(initialValue: !isCollapsed)
    }
    
    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            if isUpcoming {
                UpcomingFeatureView()
            } else if isLoading {
                VStack(spacing: 8) {
                    ListItem(name: "", tint: tint, isLoading: true)
                }
                .padding(.top, 8)
            } else if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .padding(.vertical)
            } else if items.count == 0 {
                Text("No data found")
                    .foregroundColor(.gray)
                    .padding(.vertical)
            } else {
                VStack(spacing: 0) {
                    ForEach(items.indices, id: \.self) { index in
                        let item = items[index]
                        let dest = destination(item)
                        if let dest = dest {
                            NavigationLink(destination: dest) {
                                ListItem(name: display(item), tint: tint)
                            }.buttonStyle(PlainButtonStyle())
                        } else {
                            ListItem(name: display(item), tint: tint)
                        }
                        Spacer()
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.top, 5)
            }
        } label: {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.bottom, 8)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.3))
        )
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 1)
        .onAppear {
            selectedItem = nil
        }
    }
}

struct ListItem: View {
    let name: String
    let tint: Color
    let isLoading: Bool
    
    @State private var phase: CGFloat = 0
    
    init(name: String, tint: Color, isLoading: Bool = false) {
        self.name = name
        self.tint = tint
        self.isLoading = isLoading
    }
    
    var body: some View {
        Group {
            if isLoading {
                ShimmerView()
                    .frame(height: 60)
                    .cornerRadius(10)
            } else {
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: "chevron.right")
                        .font(.subheadline)
                        .foregroundColor(tint)
                    
                    Text(name)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                .frame(height: 60)
                .padding(4)
                .padding(.leading, 8)
                .background(tint.opacity(0.1))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(tint.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: tint.opacity(0.1), radius: 1, x: 0, y: 1)
            }
        }
    }
}
