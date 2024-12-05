//
//  AddToDoView.swift
//  JeffToDoApp
//
//  Created by Jeff Handy on 12/5/24.
//

import SwiftUI

struct AddTaskView: View {
    @Binding var isPresented: Bool
    @Environment(\.modelContext) private var modelContext
    @State private var title: String = ""
    @State private var details: String = ""
    @State private var date: Date = Date()
    
    var body: some View {
        VStack {
            Text("Add New Todo Task")
                .font(.title)
                .padding()

            TextField("Task Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Task Details", text: $details)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            DatePicker("Due Date", selection: $date, displayedComponents: .date)
                .padding()

            HStack {
                Button(action: {
                    addNewTask()
                }) {
                    Text("Save Task")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Button(action: {
                    isPresented = false  // Close the Add Task view
                }) {
                    Text("Cancel")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 10))
        .padding()
    }
    
    // TODO - this functionality to be moved to viewModel!
    private func addNewTask() {
        guard !title.isEmpty else { return }
        
        // Create the new task
        let newTask = TodoTask(title: title, details: details, date: date)
        
        // Insert and save the new task to the model context
        do {
            modelContext.insert(newTask)  // Insert the task into the context
            try modelContext.save()
            print("Task successfully saved")
            isPresented = false  // Close the Add Task view
        } catch {
            // Handle error
            print("Failed to save task: \(error)")
        }
    }
}
