//
//  ToDoTask.swift
//  JeffToDoApp
//
//  Created by Jeff Handy on 12/5/24.
//

import Foundation
import SwiftData

@Model
class TodoTask {
    @Attribute var id: UUID
    @Attribute var title: String
    @Attribute var details: String
    @Attribute var date: Date
    @Attribute var isCompleted: Bool
    
    // Custom initializer
    init(id: UUID = UUID(), title: String, details: String, date: Date, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.details = details
        self.date = date
        self.isCompleted = isCompleted
    }
}
