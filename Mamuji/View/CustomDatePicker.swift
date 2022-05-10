//
//  CustomDatePicker.swift
//  Mamuji
//
//  Created by DongKyu Kim on 2022/05/02.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @Binding var currentDate: Date
    
    // Month update on arrow button clicks
    @State var currentMonth:Int = 0
    
    var body: some View {
        VStack(spacing:15){
            
            // Days
            let days: [String] = ["일", "월", "화", "수", "목", "금", "토"]
            
            HStack(spacing: 20){
                HStack(spacing: 10) {
                    Text("\(extraDate()[0])년") // Year
                        .font(.custom("AppleSDGothicNeo-Bold", size: 30))
                    Text(extraDate()[1]) // Month
                        .font(.custom("AppleSDGothicNeo-Bold", size: 35))
                }
                .padding(.bottom, 5)
                
                Spacer(minLength: 0)
                
                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            
            // Day View
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.custom("BMDoHyeon-OTF", size: 25))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                }
            }
            // Dates
            // Lazy Grid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(extractDate()) { value in
                    CardView(value: value)
                        .background(
                            Circle()
                                .fill(.gray)
                                .padding(7)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }
            // Task View
            TaskView
        }
        .onChange(of: currentMonth) { newValue in
            // updating Month
            currentDate = getCurrentMonth()
        }
    }
    
    @State var tasks = TaskMetaData.dummyData
    @ObservedObject var taskDataVm = TaskMetaDataViewModel()
    @ObservedObject var taskVm = TaskViewModel()
    @State var taskDataEx : TaskMetaData = TaskMetaData.dummyData[0]
    
    // ToDo Task View
    private var TaskView : some View {
        VStack(spacing: 15) {
            Text("오늘의 할 일")
                .font(.custom("BMDoHyeon-OTF", size: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
            
            if let task = tasks.first(where: { task in
                return isSameDay(date1: task.taskDate, date2: currentDate)
            })
            {
                // Make CheckList in here!!!
                ForEach(task.task) { task in
                    
                    HStack(spacing: 10) {
                        Button(action: {
                            taskVm.setTask(task)
                            taskVm.toggleTask()
                        }) {
                            Image(systemName: taskVm.isChecked ? "checkmark.square" : "square")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .leading)
                        }
                        // For Custom Timing
                        Text(taskVm.task.title)
                            .font(.title3.bold())
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        Color(0xE5E5EA)
                            .opacity(0.7)
                            .cornerRadius(8)
                    )
                }
            }
            else {
                Text("  아직 할 일이 없네요... \n 얼른 무지개를 채워봐요!")
                    .font(.custom("BMDoHyeon-OTF", size: 18))
                    .opacity(0.5)
            }
            HStack {
                NavigationLink(destination: GoalView()) {
                    Text("작업 추가하기")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.gray, in: Capsule())
                }
                .padding(.top)
            }
            .padding(.horizontal)
            .foregroundColor(.white)
        }
        .padding()
    }
    
    @ViewBuilder
    func CardView(value: DateValue)->some View{
        
        VStack{
            Spacer()
            if value.day != -1{
                
                // task의 날짜 체크해서 해당하는 날짜인지 확인 후 표시하기
                if let task = tasks.first(where: { task in
                    
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }){ // 날짜에 task가 있으면 원모양 표시하기
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    let rainbow: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]
                    
                    Circle()
                        .fill(rainbow[makeColor(date: value.date)])
                        .frame(width: 20, height: 20)
                        .opacity(Double(task.checkedCount)/Double(task.taskCount))
                }
                else{
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
    }
    // checking dates
    func isSameDay(date1: Date, date2: Date)->Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    // extracting Year and Month for display
    func extraDate()->[String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth()->Date{
        let calendar = Calendar.current
        
        // Getting Current Month Date
        guard let currentMonth = calendar.date(byAdding: .month, value: currentMonth, to: Date()) else {
            return Date()
        }
        
        return currentMonth
    }
    
    func extractDate()->[DateValue]{ // 각 month에 해당하는 Day Value의 집합을 담기 위해 Array 리턴
        
        let calendar = Calendar.current
        
        // Getting Current Month Date
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            // getting day
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        // adding offset days to get exact week day
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }
    
    func makeColor(date: Date) -> Int {
        let calendar = Calendar.current
        let weekday = (calendar.component(.weekday, from: date) - calendar.firstWeekday + 7) % 7
        
        return weekday
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Extending Date to get Cureent Month Dates
extension Date{
    func getAllDates()->[Date] {
        
        let calendar = Calendar.current
        
        // getting start Date
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        
        // getting date
        return range.compactMap { day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
