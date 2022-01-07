//
//  MyQuoteApp.swift
//  Shared
//
//  Created by pablo on 25/1/21.
//

import SwiftUI

@main
struct MyQuoteApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
               
        }
    }
}
