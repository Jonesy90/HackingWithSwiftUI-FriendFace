//
//  HackingWithSwiftUI_FriendFaceApp.swift
//  HackingWithSwiftUI-FriendFace
//
//  Created by Michael Jones on 25/06/2026.
//

import SwiftData
import SwiftUI

@main
struct HackingWithSwiftUI_FriendFaceApp: App {
    let dataContainer = DataContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataContainer)
        }
//        .modelContainer(for: User.self)
        .modelContainer(dataContainer.modelContainer)
    }
}
