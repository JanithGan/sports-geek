//
//  Tournament.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-05-05.
//

import SwiftUI

struct SeriesCardView: View {
    let series: Series

    var body: some View {
        NavigationLink(destination: MatchesView(seriesTitle: series.name, year: series.year)) {
            VStack(alignment: .leading, spacing: 8) {
                Text(series.name)
                    .font(.headline)
                    .foregroundColor(.blue)

                Text("Start Date: \(series.startDate)")
                Text("End Date: \(series.endDate)")
                Text("Year: \(series.year)")
                Text("Host: \(series.host)")
                Text("Won By: \(series.wonBy)")
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .shadow(radius: 3)
        }
    }
}