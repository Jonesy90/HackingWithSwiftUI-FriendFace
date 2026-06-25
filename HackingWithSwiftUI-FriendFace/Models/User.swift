//
//  User.swift
//  HackingWithSwiftUI-FriendFace
//
//  Created by Michael Jones on 25/06/2026.
//

import Foundation

struct User: Hashable, Identifiable, Codable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    static let example = User(id: UUID(), isActive: true, name: "Michael Jones", age: 35, company: "Acixom", email: "michael.jones90@me.com", address: "N/A", about: "N/A", registered: Date.now, tags: ["N/A"], friends: [])
}
