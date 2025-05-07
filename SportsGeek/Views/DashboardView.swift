//
//  DashboardView.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-04-21.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Text("Dashboard")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                
                    Divider()
                        .frame(height: 1)
                        .background(Color.gray.opacity(0.3))
                             

                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.sports) { sport in
                        NavigationLink(destination: SportOverviewView(sportId: sport.id)) {
                            CardViewWithIcon(
                                name: sport.name,
                                icon: sport.icon,
                                tint: sport.themeColor
                            ).frame(height: 200)
                        }
                    }.padding(.horizontal, 16)
                }
                .padding(.horizontal, 16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color(.systemBackground))
            .navigationBarHidden(true)
        }
    }
}
#Preview {
    DashboardView()
}
