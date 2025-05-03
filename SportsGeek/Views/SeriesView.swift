import SwiftUI

struct SeriesView: View {
    let tournamentName: String
    @StateObject private var viewModel = SeriesViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Text(tournamentName)
                .font(.largeTitle)
                .bold()
                .padding(.top)

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.seriesList) { series in
                        SeriesCardView(series: series)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Series List")
        .onAppear {
            viewModel.fetchSeries(forTournamentId: "mock") // Replace with actual ID later
        }
    }
}

struct SeriesCardView: View {
    let series: Series

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(series.name)
                .font(.headline)
                .foregroundColor(.blue)

            Text("Start Date: \(series.startDate)")
            Text("End Date: \(series.endDate)")
            Text("Host: \(series.host)")
            Text("Won By: \(series.wonBy)")
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}
