//
//  File.swift
//  JournalCoreData
//
//  Created by James Lea on 4/26/21.
//

import CoreData

class EntryController {
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
     let request = NSFetchRequest<Entry>(entityName: "Entry")
     request.predicate = NSPredicate(value: true)
     return request
    }()
    
    func fetchEntries(){
//        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
//        print(entries.count)
//        self.entries = entries
        entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
    }
    
    func createEntry(title: String, bodyText: String) {
        Entry(title: title, bodyText: bodyText)
//        entries.append(entry)
        CoreDataStack.saveContext()
    }
    
    func updateEntry(entry: Entry, title: String, body: String) {
        entry.title = title
        entry.bodyText = body
        entry.timestamp = Date()
        CoreDataStack.saveContext()
    }
    
    func deleteEntry(entry: Entry){
        guard let entryToDelete = entries.firstIndex(of: entry) else {return}
        entries.remove(at: entryToDelete)
        CoreDataStack.saveContext()
    }
}
