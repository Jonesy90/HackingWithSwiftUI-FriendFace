//
//  ContentView.swift
//  HackingWithSwiftUI-FriendFace
//
//  Created by Michael Jones on 25/06/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    Text(user.name)
                }
            }
            .navigationTitle("FriendFace")
            .task {
                await fetchUsers()
            }
        }
    }
    
    private func fetchUsers() async {
        /// We don't refetch data if we already have it.
        guard users.isEmpty else { return }
        
        do {
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { return }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedUsers = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedUsers
            }
            
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
