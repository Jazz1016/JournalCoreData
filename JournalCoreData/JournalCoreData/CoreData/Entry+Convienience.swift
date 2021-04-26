//
//  Entry+Convienience.swift
//  JournalCoreData
//
//  Created by James Lea on 4/26/21.
//

import CoreData

extension Entry {
    
    @discardableResult convenience init(title: String, bodyText: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
    }
}

extension Entry {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title && lhs.bodyText == rhs.bodyText && lhs.timestamp == rhs.timestamp
    }
}
