//
//  DateFormatter.swift
//  JournalCoreData
//
//  Created by James Lea on 4/26/21.
//

import Foundation

extension DateFormatter {
    
    static let entryTime: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}//End of extension
