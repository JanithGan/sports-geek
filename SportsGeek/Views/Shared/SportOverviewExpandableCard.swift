//
//  SportOverviewExpandableCard.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-20.
//

struct SportOverviewExpandableCard<Content: View>: View {
    let title: String
    @Binding var isExpanded: Bool
    let content: () -> Content

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: { isExpanded.toggle() }) {
                HStack {
                    Text(title)
                        .font(.headline)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                }
            }
            if isExpanded {
                content()
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}