//
//  iManagerApp.swift
//  iManager
//
//  Created by Yurii on 03.05.2022.
//

import SwiftUI

@main
struct iManagerApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
