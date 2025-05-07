//
//  LoadingView.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-03.
//

import SwiftUI

struct LoadingView: View {
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()

            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .scaleEffect(isAnimating ? 1.1 : 1.0)
                .background(Color(.systemBackground))
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
                        isAnimating = true
                    }
                }
        }
    }
}

#Preview {
    LoadingView()
}
