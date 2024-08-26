//
//  UserRepository.swift
//  CoolTheEarth
//
//  Created by Nguyen Tuong Khang on 25/8/24.
//

import Foundation
import SwiftUI

class UserRepository {
    @AppStorage("users") private var storedUsers: String = "[]"
    
    func addUser(_ newUser: User) {
        var users = loadUsers()
        users.append(newUser)
        saveUsers(users)
    }
    
    func getAllUsers() -> [User] {
        return loadUsers()
    }
    
    func updateUser(_ updatedUser: User) {
        var users = loadUsers()
        if let index = users.firstIndex(where: { $0.id == updatedUser.id }) {
            users[index] = updatedUser
            saveUsers(users)
        }
    }
    
    func deleteUser(_ user: User) {
        var users = loadUsers()
        users.removeAll { $0.id == user.id }
        saveUsers(users)
    }
    
    private func saveUsers(_ users: [User]) {
        if let encodedUsers = try? JSONEncoder().encode(users) {
            storedUsers = String(data: encodedUsers, encoding: .utf8) ?? "[]"
        }
    }
    
    private func loadUsers() -> [User] {
        if let data = storedUsers.data(using: .utf8),
           let decodedUsers = try? JSONDecoder().decode([User].self, from: data) {
            return decodedUsers
        }
        return []
    }
}
