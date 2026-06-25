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
                    NavigationLink(value: user) {
                        HStack {
                            Circle()
                                .fill(user.isActive ? .green : .red)
                                .frame(width: 30)
                            
                            VStack(alignment: .leading) {
                                Text(user.name)
                                Text(user.company)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationTitle("FriendFace")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
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
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            users = try decoder.decode([User].self, from: data)
            
        } catch {
            print("Failed to download.")
        }
    }
}

#Preview {
    ContentView()
}
