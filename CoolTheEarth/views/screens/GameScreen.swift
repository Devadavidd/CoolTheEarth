//
//  GameScreen.swift
//  CoolTheEarth
//
//  Created by Nguyen Tuong Khang on 26/8/24.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct GameScreen: View {
    
    @State private var score: Int = 0
    @State private var showScoreIncrease: Bool = false
    @State private var tapPosition: CGPoint = .zero
    
    let scoreTextColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)

    private func tapEarth(at location: CGPoint) {
        score += 10
        tapPosition = location
        showScoreIncrease = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeOut(duration: 1.0)) {
                self.showScoreIncrease = false
            }
        }
    }
    
    var body: some View {
        ZStack {
            Spacer()
            if let path = Bundle.main.path(forResource: "earth-rotate", ofType: "gif") {
                WebImage(url: URL(fileURLWithPath: path))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
                    .cornerRadius(10)
                    .padding()
                    .onTapGesture { location in
                        tapEarth(at: location)
                    }
            } else {
                Text("GIF not found")
                    .foregroundColor(.red)
            }
            
            if showScoreIncrease {
                Text("+10")
                    .bold()
                    .font(.custom("Kenney Future Narrow", size: 40))
                    .foregroundColor(Color(scoreTextColor)) // Custom color here
                    .position(tapPosition)
                    .opacity(showScoreIncrease ? 1 : 0)
                    .transition(.scale)
                    .scaleEffect(showScoreIncrease ? 1 : 0)
    
                
                
                
            }
            
            Spacer()
        }
    }
}

#Preview() {
    GameScreen()
}

