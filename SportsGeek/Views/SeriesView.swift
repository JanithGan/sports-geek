import SwiftUI

struct SeriesCardView: View {
    let series: SportsSeries

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

struct SeriesView: View {
    // Mock series data
    let mockSeriesList: [SportsSeries] = [
        SportsSeries(id: "1", name: "ODI Series Bangladesh vs. Sri Lanka", startDate: "2025-02-21", endDate: "2025-02-28", year: "2025", host: "Sri Lanka", wonBy: "Sri Lanka"),
        SportsSeries(id: "2", name: "ODI Series Bangladesh vs. Sri Lanka", startDate: "2024-03-13", endDate: "2024-03-18", year: "2024", host: "Bangladesh", wonBy: "Bangladesh"),
        SportsSeries(id: "3", name: "ODI Series Bangladesh vs. Sri Lanka", startDate: "2023-01-05", endDate: "2023-01-10", year: "2023", host: "Sri Lanka", wonBy: "Sri Lanka")
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("ODI Series Ban vs SL")
                .font(.largeTitle)
                .bold()
                .padding(.top)

            ScrollView {
                VStack(spacing: 16) {
                    // First card is tappable and navigates
                    NavigationLink(destination: MatchesView(seriesTitle: mockSeriesList[0].name, year: mockSeriesList[0].year)) {
                        SeriesCardView(series: mockSeriesList[0])
                    }

                    // Remaining cards (not navigated)
                    ForEach(mockSeriesList.dropFirst()) { series in
                        SeriesCardView(series: series)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview{
    SeriesView()
}
