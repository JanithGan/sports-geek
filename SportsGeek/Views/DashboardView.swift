//
//  DashboardView.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-04-21.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Dashboard")
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)

                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.sports) { sport in
                            CardView(name: sport.name, icon: sport.icon)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DashboardView()
}
