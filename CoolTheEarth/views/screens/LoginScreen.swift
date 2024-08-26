//
//  LoginScreen.swift
//  CoolTheEarth
//
//  Created by Nguyen Tuong Khang on 25/8/24.
//

import Foundation
import SwiftUI

struct LoginScreen: View {
    @State private var username: String = ""
    @State private var showAlert = false
    private var userRepository = UserRepository()
    
    var body: some View {

        VStack(spacing: 20) {
            Spacer()
            Text("Welcome to the Game!")
                .font(.custom("Kenney Future Narrow", size: 20))
                .padding()
            
            TextField("Username", text: $username)
                .font(.custom("Kenney Future Narrow", size: 12))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(
                    Image("button_rectangle_depth_line")
                        .resizable()
                )
                .frame(width: 300)
            
            
            Button(action: {
                if username.isEmpty {
                    showAlert = true
                } else {
                    registerUser(username: username)
                }
            }) {
                Image("button_rectangle_depth_gloss")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 60)
                    .overlay(
                        Text("Register")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    )
            }
            .buttonStyle(PlainButtonStyle())
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text("Please enter a username"), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
        }
        .padding()
        .applyGameBackground()
    }
    
    func registerUser(username: String) {
        // Register the user into the game with the entered username
        let newUser = User(name: username, points: 0, isPlaying: true)
        userRepository.addUser(newUser)
        print("User \(username) registered")
    }
}

#Preview {
    LoginScreen()
}

