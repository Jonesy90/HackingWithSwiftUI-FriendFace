//
//  UserDetailView.swift
//  HackingWithSwiftUI-FriendFace
//
//  Created by Michael Jones on 25/06/2026.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        List {
            Section("About") {
                Text(user.about)
                    .padding(.vertical)
            }
            
            Section("Contact Details") {
                Text("Address: \(user.address)")
                Text("Company: \(user.company)")
            }
            
            Section("Friends") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserDetailView(user: User.sample)
}
