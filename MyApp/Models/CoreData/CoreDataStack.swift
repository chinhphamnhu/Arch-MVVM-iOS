//
//  CoreDataCacheStack.swift
//  MyApp
//
//  Created by Chinh Pham N. on 7/9/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import CoreData

final class CoreDataStack {

    // MARK: - Properties

    static let shared = CoreDataStack()
    let persistentContainer: NSPersistentContainer
    let modelName = "CacheModel"

    lazy var managedObjectContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()

    // MARK: - Initialize

    private init() {
        persistentContainer = NSPersistentContainer(name: modelName)
        persistentContainer.loadPersistentStores { _, error in
            guard error == nil else {
                let localizedDescription = (error?.localizedDescription).unwrapped(or: "")
                fatalError(localizedDescription)
            }
        }
    }

    // MARK: - Public Functions

    func flush() {
        let request: NSFetchRequest<CachedEntity> = CachedEntity.fetchRequest()
        let response = try? managedObjectContext.fetch(request)
        guard let data = response, !data.isEmpty else { return }
        data.forEach { managedObjectContext.delete($0) }
        try? managedObjectContext.save()
    }
}
