//
//  ContentView.swift
//  CoolTheEarth
//
//  Created by Nguyen Tuong Khang on 25/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .game
    
    enum Tab {
        case game
        case leaderboard
        case achievement
    }
    
    
    
    var body: some View {
        VStack () {
            Group {
                switch selectedTab {
                case .game:
                    NavigationView {
                        GameScreen()
                    }
                case .leaderboard:
                    NavigationView {
                        LeaderboardScreen()
                    }
                case .achievement:
                    NavigationView {
                        AchievementScreen()
                    }
                }
            }
            MainTabBar(selectedTab: $selectedTab)
        }
        
    }
}

#Preview {
    ContentView()
}
