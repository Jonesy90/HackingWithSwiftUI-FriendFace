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
    
    @State private var viewModel = ViewModel(users: [], dataContainer: DataContainer())
    
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
            /// A SwiftUI modifier that lets you run asynchronous code when the view appears.
            .task {
                viewModel.users = users
                viewModel.dataContainer = dataContainer
                await viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    ContentView()
        .sampleDataContainer()
}
