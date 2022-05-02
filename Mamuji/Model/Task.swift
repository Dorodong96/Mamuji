//
//  Task.swift
//  Mamuji
//
//  Created by DongKyu Kim on 2022/05/02.
//

import SwiftUI

// Task Model and Sample Tasks
// Array of Tasks
struct Task: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

// Total Task Meta View
struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

// sample Date for Testing
func getSampleDate(offset: Int)->Date{
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

// sample Tasks
var tasks: [TaskMetaData] = [
    TaskMetaData(task: [
    
        Task(title: "Talk to Cookie"),
        Task(title: "Study Swift"),
        Task(title: "Nothing Much Workout")
    ], taskDate: getSampleDate(offset: 1)),
    
    TaskMetaData(task: [
        
        Task(title: "Talk to Tim Cook")
    ], taskDate: getSampleDate(offset: -3)),
    
    TaskMetaData(task: [
        
        Task(title: "Talk to Tim Cook")
    ], taskDate: getSampleDate(offset: 10)),
    
    TaskMetaData(task: [
        
        Task(title: "Talk to Tim Cook")
    ], taskDate: getSampleDate(offset: -22)),
    
    TaskMetaData(task: [
        
        Task(title: "Talk to Tim Cook")
    ], taskDate: getSampleDate(offset: 15)),
    
    TaskMetaData(task: [
        
        Task(title: "Talk to Tim Cook")
    ], taskDate: getSampleDate(offset: -20))
]
