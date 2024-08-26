//
//  TabItem.swift
//  CoolTheEarth
//
//  Created by Nguyen Tuong Khang on 26/8/24.
//

import Foundation
import SwiftUI

struct TabItem: View {
    var title: String
    var systemImage: String
    @Binding var selectedTab: ContentView.Tab
    var tab: ContentView.Tab

    var body: some View {
        VStack {
            Image(systemImage)
                .font(.largeTitle)
                .frame(width: 100, height: 50)
                .padding(1)
        }
        .frame(width: 80, height: 80)
        // I want the background have the color as this asset image name button_square_depth_line
        .background(
            Image("button_square_depth_line")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .opacity(selectedTab == tab ? 1.0 : 0.5) // Adjust opacity based on selection
        )
        .cornerRadius(10)
        .onTapGesture {
            withAnimation(.easeInOut) {
                selectedTab = tab
            }
        }
    }
}

struct TabItem_PreviewWrapper: View {
    @State private var selectedTab: ContentView.Tab = .game

    var body: some View {
        TabItem(title: "Game", systemImage: "arrow_basic_e_small", selectedTab: $selectedTab, tab: .game)
    }
}

#Preview {
    TabItem_PreviewWrapper()
}
