//
//  CoolTheEarthApp.swift
//  CoolTheEarth
//
//  Created by Nguyen Tuong Khang on 25/8/24.
//

import SwiftUI

func checkStoredAppStorage() {
    if let storedUsers = UserDefaults.standard.string(forKey: "users") {
        print("Stored users JSON string: \(storedUsers)")
        
        // Attempt to decode it back into an array of User objects
        if let data = storedUsers.data(using: .utf8),
           let users = try? JSONDecoder().decode([User].self, from: data) {
            print("Decoded Users:")
            for user in users {
                print("Name: \(user.name), Points: \(user.points), isPlaying: \(user.isPlaying)")
            }
        } else {
            print("Failed to decode the stored users.")
        }
    } else {
        print("No users stored in AppStorage.")
    }
}

@main
struct CoolTheEarthApp: App {
    private var userRepository = UserRepository()
    
    init() {
          checkStoredAppStorage() // Call this during app initialization or wherever appropriate
    }
      
    
    var body: some Scene {
        WindowGroup {
            if shouldShowLoginScreen() {
                LoginScreen()
            } else {
                ContentView()
            }
        }
    }
    
    func shouldShowLoginScreen() -> Bool {
        let users = userRepository.getAllUsers()
        return users.allSatisfy { !$0.isPlaying }
    }
}
