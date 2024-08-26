//
//  User.swift
//  CoolTheEarth
//
//  Created by Nguyen Tuong Khang on 25/8/24.
//

import Foundation
struct User: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var points: Int
    var isPlaying: Bool
}
