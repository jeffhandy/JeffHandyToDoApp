//
//  TodoTaskViewModel.swift
//  JeffToDoApp
//
//  Created by Jeff Handy on 12/5/24.
//


import SwiftUI
import SwiftData


// TODO - migrate addNewTask(), loadTasks() to viewModel, remove from ContentView

/*class TodoTaskViewModel: ObservableObject {
 @Published var tasks: [TodoTask] = []
 @Environment(\.modelContext) private var modelContext  // Assume the ModelContext is available
 
 // This function will add a new task and save it to the database
 func addNewTask(title: String, details: String, date: Date) {
 let newTask = TodoTask(title: title, details: details, date: date, isCompleted: false)
 
 // Add the new task to the model context (save to the database)
 do {
 modelContext.insert(newTask)  // Insert the new task into the context
 try modelContext.save()  // Save to disk
 tasks.append(newTask)  // Update the tasks array to reflect the new task
 } catch {
 print("Failed to save task: \(error)")
 }
 }
 
 // Example of a method to load tasks from the database
 func loadTasks() {
 do {
 let fetchedTasks = try modelContext.fetch(TodoTask.self)
 tasks = fetchedTasks
 } catch {
 print("Failed to load tasks: \(error)")
 }
 }
 }
 */

