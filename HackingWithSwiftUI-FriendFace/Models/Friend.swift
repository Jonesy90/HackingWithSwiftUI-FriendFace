//
//  Friend.swift
//  HackingWithSwiftUI-FriendFace
//
//  Created by Michael Jones on 25/06/2026.
//

import Foundation

struct Friend: Hashable, Identifiable, Codable {
    var id: UUID
    var name: String
}
