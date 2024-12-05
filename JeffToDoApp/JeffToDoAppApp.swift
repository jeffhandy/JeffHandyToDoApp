//
//  JeffToDoAppApp.swift
//  JeffToDoApp
//
//  Created by Jeff Handy on 12/5/24.
//

import SwiftUI
import SwiftData

@main
struct JeffToDoAppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            TodoTask.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    @Environment(\.modelContext) private var modelContext

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
        }
    }
}

