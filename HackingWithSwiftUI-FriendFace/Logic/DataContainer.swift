//
//  DataContainer.swift
//  HackingWithSwiftUI-FriendFace
//
//  Created by Michael Jones on 26/06/2026.
//

import SwiftData
import SwiftUI

/// This class is designed to set up a model container and provide an easy way to access the main context, and optionally load sample data.
@Observable
@MainActor
class DataContainer {
    /// Holds the main ModelContainer instance and is responsible for managing the database.
    let modelContainer: ModelContainer
    
    /// Computed property for accessing the main database context model from the container. This is used for creating, fetching and saving model objects.
    var context: ModelContext {
        modelContainer.mainContext
    }
     
    init(includeSampleUsers: Bool = false) {
        let schema = Schema([
            User.self
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: includeSampleUsers)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            if includeSampleUsers {
                loadExampleUsers()
            }
            
            try context.save()
        } catch {
            fatalError("Unable to create ModelContainer: \(error.localizedDescription)")
        }
    }
    
    private func loadExampleUsers() {
        
    }
}

private let sampleContainer = DataContainer(includeSampleUsers: true)

extension View {
    func sampleDataContainer() -> some View {
        self
            .environment(sampleContainer)
            .modelContainer(sampleContainer.modelContainer)
    }
}
