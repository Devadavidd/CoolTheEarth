//
//  Navigation.swift
//  CoolTheEarth
//
//  Created by Nguyen Tuong Khang on 26/8/24.
//


import SwiftUI
import AnimatedTabBar


struct MainTabBar: View {
    @Binding var selectedTab: ContentView.Tab
    @State private var selectedIndex: Int = 0

    var body: some View {
        
        
        AnimatedTabBar(selectedIndex: $selectedIndex) {
            TabItem(title: "Leaderboard", systemImage: "check_square_color", selectedTab: $selectedTab, tab: .leaderboard)
                .onTapGesture {
                    selectTab(.leaderboard)
                }
            TabItem(title: "Game", systemImage: "arrow_basic_e_small", selectedTab: $selectedTab, tab: .game)
                .onAppear {
                    updateSelectedIndex()
                }
                .onTapGesture {
                    selectTab(.game)
                }
            TabItem(title: "Achievement", systemImage: "icon_checkmark", selectedTab: $selectedTab, tab: .achievement)
                .onTapGesture {
                    selectTab(.achievement)
                }
        }.ballColor(Color.blue)
        .onChange(of: selectedTab) { _ in
            updateSelectedIndex()
        }
    }

    private func updateSelectedIndex() {
        selectedIndex = index(for: selectedTab)
    }

    private func index(for tab: ContentView.Tab) -> Int {
        switch tab {
        case .leaderboard:
            return 0
        case .game:
            return 1
        case .achievement:
            return 2
        }
    }

    private func selectTab(_ tab: ContentView.Tab) {
        withAnimation(.easeInOut) {
            selectedTab = tab
            updateSelectedIndex()
        }
    }
}



struct MainTabBar_PreviewWrapper: View {
    @State private var selectedTab: ContentView.Tab = .game

    var body: some View {
        MainTabBar(selectedTab: $selectedTab)
    }
}


#Preview {
   MainTabBar_PreviewWrapper()
}

