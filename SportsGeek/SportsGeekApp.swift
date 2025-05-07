//
//  SportsGeekApp.swift
//  SportsGeek
//
//  Created by Janith Ganepola on 2025-04-10.
//

import SwiftUI

@main
struct SportsGeekApp: App {
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            if showSplash {
                LoadingView()
                    .onAppear {
                        // Display for 1.5 sec
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                DashboardView()
                
            }
        }
    }
}
