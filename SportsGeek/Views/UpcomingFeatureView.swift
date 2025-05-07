//
//  UpcomingFeatureView.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-05-06.
//

import SwiftUI

struct UpcomingFeatureView: View {
    var title: String = "Coming Soon!"
    var message: String = "This feature is in development. Stay tuned for updates."
    
    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
            
            Text(message)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Image(systemName: "arrow.down.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    UpcomingFeatureView()
}
