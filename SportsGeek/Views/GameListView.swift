import SwiftUI

struct GameListView: View {
    let seriesTitle: String
    let year: String

    let games: [Game] = [
        Game(id: "1", title: "ODI Series Bangladesh vs. Sri Lanka 2025", date: "2025-02-21", venue: "Rangiri Dambulla Stadium", wonBy: "Sri Lanka"),
        Game(id: "2", title: "ODI Series Bangladesh vs. Sri Lanka 2025", date: "2025-02-24", venue: "Keththarama Stadium", wonBy: "Sri Lanka"),
        Game(id: "3", title: "ODI Series Bangladesh vs. Sri Lanka 2025", date: "2025-02-28", venue: "Keththarama Stadium", wonBy: "Sri Lanka")
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(seriesTitle) \(year)")
                .font(.title)
                .bold()
                .padding(.top)

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(games) { game in
                        GameCardView(game: game)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Game: Identifiable {
    let id: String
    let title: String
    let date: String
    let venue: String
    let wonBy: String
}

struct GameCardView: View {
    let game: Game

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(game.title)
                .font(.headline)
                .foregroundColor(.blue)

            Text("Date: \(game.date)")
            Text("Venue: \(game.venue)")
            Text("Won By: \(game.wonBy)")
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}

#Preview{
    GameListView(seriesTitle: "ODI Series Ban vs SL", year: "2025")
}
