//
//  ShimmerView.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-06.
//

import SwiftUI

struct ShimmerView: View {
    @State private var move = false

    var body: some View {
        ZStack {
            Color.gray.opacity(0.2)
            Color.white
                .opacity(0.6)
                .mask(
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.clear, .white.opacity(0.6), .clear]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .rotationEffect(.degrees(20))
                        .offset(x: move ? 350 : -350)
                )
        }
        .onAppear {
            withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                move = true
            }
        }
    }
}
