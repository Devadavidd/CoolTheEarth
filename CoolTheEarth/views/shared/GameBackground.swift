//
//  GameBackground.swift
//  CoolTheEarth
//
//  Created by Nguyen Tuong Khang on 25/8/24.
//

import Foundation
import SwiftUI

struct GameBackground: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.white.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            content
        }
    }
}

extension View {
    func applyGameBackground() -> some View {
        self.modifier(GameBackground())
    }
}
