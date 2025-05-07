//
//  CardView.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-06.
//

import SwiftUI

struct CardView: View {
    let heading: String
    let tint: Color
    let infoItems: [(String, String)]
    let cornerRadius: CGFloat
    let padding: CGFloat
    let shadowRadius: CGFloat
    let isLoading: Bool
    
    init(
        heading: String,
        infoItems: [(String, String)],
        tint: Color = .accentColor,
        isLoading: Bool = false,
        cornerRadius: CGFloat = 16,
        padding: CGFloat = 16,
        shadowRadius: CGFloat = 4
    ) {
        self.heading = heading
        self.infoItems = infoItems
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.shadowRadius = shadowRadius
        self.tint = tint
        self.isLoading = isLoading
    }
    
    var body: some View {
        Group {
            if isLoading {
                ShimmerView()
                    .frame(height: 150)
                    .cornerRadius(10)
                    .padding()
            }
            else {
                VStack(alignment: .leading, spacing: 12) {
                    Text(heading)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.bottom, 8)
                        .multilineTextAlignment(.leading)
                    
                    ForEach(infoItems, id: \.0) { item in
                        HStack(alignment: .top, spacing: 8) {
                            Text(item.0)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .frame(width: 100, alignment: .leading)
                            
                            Text(item.1)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                                .lineLimit(nil)
                            
                            Spacer()
                        }
                    }
                }
                .padding(padding)
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(tint.opacity(0.1))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(tint.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: tint.opacity(0.08), radius: shadowRadius, x: 0, y: 2)
                .padding(.horizontal)
            }
        }
    }
}
