//
//  CardView.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-04-22.
//

import SwiftUI

struct CardViewWithIcon: View {
    let name: String
    let icon: String
    let tint: Color

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(tint)
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
            }
            .frame(height: 120)

            Text(name)
                .font(.headline)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(Color(.systemBackground))
        }
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(tint.opacity(0.8), lineWidth: 1)
        )
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.04), radius: 2, x: 0, y: 1)
    }
}
