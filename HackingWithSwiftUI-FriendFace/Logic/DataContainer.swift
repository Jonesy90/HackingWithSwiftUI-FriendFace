//
//  DataContainer.swift
//  HackingWithSwiftUI-FriendFace
//
//  Created by Michael Jones on 26/06/2026.
//

import SwiftData
import SwiftUI

@Observable
@MainActor
class DataContainer {
    let modelContainer: ModelContainer
    
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
