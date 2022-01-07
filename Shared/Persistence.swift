//
//  Persistence.swift
//  Shared
//
//  Created by pablo on 25/1/21.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Configuracion(context: viewContext)
            newItem.quote = "my Quote"
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MyQuote")
        guard let fileContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.PABLOMILLANLOPEZ.To-Do") else {
            fatalError("Shared file container could not be created.")
        }
        
        let storageURL = fileContainer.appendingPathComponent("ToDoAppDatabase.sqlite")
        
        let description = NSPersistentStoreDescription(url: storageURL)
        container.persistentStoreDescriptions = [description]
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
