//
//  TaskViewModel.swift
//  iManager
//
//  Created by Yurii on 03.05.2022.
//

import Foundation
import CoreData

@MainActor class TaskViewModel: ObservableObject {
    @Published var currentTab = "Today"
    @Published var openEditTask = false
    @Published var taskTitle = ""
    @Published var taskColor = "Yellow"
    @Published var taskDeadline = Date()
    @Published var taskType = "Basic"
    @Published var showDatePicker = false
    @Published var editTask: Task?
    
    func addTask(context: NSManagedObjectContext) -> Bool {
        var task: Task!
        
        if let editTask = editTask {
            task = editTask
        } else {
            task = Task(context: context)
        }
        
        task.title = taskTitle
        task.color = taskColor
        task.deadline = taskDeadline
        task.type = taskType
        task.isCompleted = false
        
        if let _ = try? context.save() {
            return true
        }
        
        return false
    }
    
    func resetTaskData() {
        taskType = "Basic"
        taskColor = "Yellow"
        taskTitle = ""
        taskDeadline = Date()
    }
    
    func setupTask() {
        if let editTask = editTask {
            taskType = editTask.type ?? "Basic"
            taskColor = editTask.color ?? "Yellow"
            taskTitle = editTask.title ?? ""
            taskDeadline = editTask.deadline ?? Date()
        }
    }
}
