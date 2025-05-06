//
//  SportOverviewDescriptionCard.swift
//  SportsGeek
//
//  Created by Pramuditha Sirisena on 2025-04-20.
//

import SwiftUI

struct SportOverviewDescriptionCard: View {
    let imageName: String
    let title: String
    let description: String

    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)

            Text(title)
                .font(.headline)
                .padding(.top, 5)

            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}