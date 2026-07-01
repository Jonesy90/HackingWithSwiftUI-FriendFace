//
//  ContentView.swift
//  HackingWithSwiftUI-FriendFace
//
//  Created by Michael Jones on 25/06/2026.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(DataContainer.self) private var dataContainer
    @Query(sort: \User.name) var users: [User]
    
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
    
    /// An asynchronous method to download user data from an external server (URL), the JSON data is then decoded into a [User] object and is inserted into a persistent store (using SwiftData).
    private func fetchUsers() async {
        /// If the list of users is not empty, the function will exit early and not fetch any data. Preventing any unnecessary network requests.
        guard users.isEmpty else { return }
        
        
        do {
            /// Ensures the URL is a valid URL. Exits if it is not.
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { return }
            
            /// Uses Swift Concurrency to download the data from the URL.
            /// Returns the data and the response but only the data is used.
            let (data, _) = try await URLSession.shared.data(from: url)
            
            /// Configure a JSON Decoder.
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            /// Decodes the downloaded JSON data into an array of [User].
            let downloadedUsers = try decoder.decode([User].self, from: data)
            /// Loops over the [User] array and inserts each User instance into Data Container.
            for user in downloadedUsers {
                dataContainer.context.insert(user)
            }
            
        } catch {
            print("Failed to download.")
        }
    }
}

#Preview {
    ContentView()
        .sampleDataContainer()
}
