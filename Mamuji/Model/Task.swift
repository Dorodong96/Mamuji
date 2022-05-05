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
    var isChecked: Bool = false
    var title: String
    
    mutating func toggleTask() {
        isChecked = !isChecked
    }
}

// Total Task Meta View
struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
    var taskCount: Int
    var checkedCount: Int = 0
    
    init(task: [Task], taskDate: Date, checkedCount: Int) {
        self.task = task
        self.taskDate = taskDate
        self.taskCount = task.count
        self.checkedCount = checkedCount
    }
}

class TaskMetaDataViewModel: ObservableObject {
    @Published var taskDatas : [TaskMetaData] = []
    
    
}

// sample Date for Testing
func getSampleDate(offset: Int)->Date{
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

// sample Tasks
extension TaskMetaData {
    static var dummyData = [
        TaskMetaData(task: [
            
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "Study Swift"),
            Task(title: "Nothing Much Workout")
        ], taskDate: getSampleDate(offset: -1), checkedCount: 3),
        
        TaskMetaData(task: [
            
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
        ], taskDate: getSampleDate(offset: -2), checkedCount: 3),
        
        TaskMetaData(task: [
            
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기")
        ], taskDate: getSampleDate(offset: -3), checkedCount: 3),
        
        TaskMetaData(task: [
            
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기")
        ], taskDate: getSampleDate(offset: -4), checkedCount: 3),
        
        TaskMetaData(task: [
            
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기")
        ], taskDate: getSampleDate(offset: -5), checkedCount: 1),
        
        TaskMetaData(task: [
            
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기")
        ], taskDate: getSampleDate(offset: -6), checkedCount: 1),
        TaskMetaData(task: [
            
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기")
        ], taskDate: getSampleDate(offset: -7), checkedCount: 3),
        TaskMetaData(task: [
            Task(title: "오늘도 열심히 개발하기")
        ], taskDate: getSampleDate(offset: -8), checkedCount: 1),
        TaskMetaData(task: [
            
            Task(title: "오늘도 열심히 개발하기")
        ], taskDate: getSampleDate(offset: -9), checkedCount: 1),
        TaskMetaData(task: [
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기")
        ], taskDate: getSampleDate(offset: -10), checkedCount: 1),
        TaskMetaData(task: [
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기")
        ], taskDate: getSampleDate(offset: -11), checkedCount: 1),
        TaskMetaData(task: [
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기")
        ], taskDate: getSampleDate(offset: -12), checkedCount: 1),
        TaskMetaData(task: [
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기")
        ], taskDate: getSampleDate(offset: -13), checkedCount: 1),
        TaskMetaData(task: [
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기")
        ], taskDate: getSampleDate(offset: -14), checkedCount: 1),
        TaskMetaData(task: [
            
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기"),
            Task(title: "오늘도 열심히 개발하기")
        ], taskDate: getSampleDate(offset: -15), checkedCount: 1)
    ]
}
