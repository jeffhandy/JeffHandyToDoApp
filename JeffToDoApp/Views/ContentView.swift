//
//  ContentView.swift
//  JeffToDoApp
//
//  Created by Jeff Handy on 12/5/24.
//

import SwiftUI
import SwiftData

import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var searchQuery = ""
    @State private var selectedDate: Date = Date()
    @State private var showCalendar = false
    @State private var showAddTaskView = false  // To toggle the Add Task sheet

    // TODO - Fix Queries for Date matching
    //@Query(sort: \TodoTask.date, order: .forward) var tasks: [TodoTask]
    @Query var tasks: [TodoTask]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(filteredTasks) { task in
                        HStack {
                            Text(task.title)
                            Spacer()
                            Text(task.date, style: .date)
                        }
                    }
                    .onDelete(perform: deleteTasks)
                }
                .sheet(isPresented: $showAddTaskView) {
                    AddTaskView(isPresented: $showAddTaskView)
                }
                .sheet(isPresented: $showCalendar) {
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                        .padding()
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                // Search Bar in the Navigation Bar
                ToolbarItem(placement: .navigationBarLeading) {
                    SearchBar(searchQuery: $searchQuery)
                }
                
                // Button to Show Calendar
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showCalendar.toggle()
                    }) {
                        Text("Filter by Date")
                    }
                }
                
                // Button to Add New Task
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddTaskView.toggle() // Show the Add Task form
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                    }
                }
            }
        }
        .onChange(of: tasks) { newTasks in
            // Force the view to refresh when tasks change
            print("Tasks have been updated: \(newTasks)")  // Debugging message
        }
    }
    
    // TODO - move this function to viewModel()!
    
    //Filter tasks by search query and selected date
    private var filteredTasks: [TodoTask] {
        
        // TODO - adjust query for dates and text searches
        tasks.filter { task in
            var matchesQuery = task.title.lowercased().contains(searchQuery.lowercased())
            if searchQuery == "" { matchesQuery = true }
            
            // TODO - fix date & query filter
            //let taskDate = Calendar.current.startOfDay(for: task.date)
            //let selectedDateStart = Calendar.current.startOfDay(for: selectedDate)
            //return matchesQuery && taskDate == selectedDateStart
            
            return matchesQuery
        }
    }

    // TODO - move this function to viewModel()!
    
    // Delete tasks from the model context
    private func deleteTasks(at offsets: IndexSet) {
        for index in offsets {
            let task = tasks[index]
            modelContext.delete(task)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Error saving after deletion: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(for: TodoTask.self) // Provide model context for preview
    }
}
