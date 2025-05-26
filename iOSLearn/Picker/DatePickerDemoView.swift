//
//  DatePickerDemoView.swift
//  iOSLearn
//
//  教程: https://www.bilibili.com/video/BV187E3zLEbi?p=13
//  doc: https://developer.apple.com/documentation/swiftui/datepicker
//
//  Created by kempluo on 2025/5/26.
//

import SwiftUI

struct DatePickerDemoView: View {
    @State private var selectedDate: Date = .init()

    @State private var selectedDates: Set<DateComponents> = []

    @State private var selectedDateString: String = ""

    var body: some View {
        // in 设置可选择的范围
//        DatePicker("Date:", selection: $selectedDate, in: Date()..., displayedComponents: .date)
//            .padding()
//            .datePickerStyle(.automatic)
        ////            .datePickerStyle(.compact) // same

//        DatePicker("Date:", selection: $selectedDate)
//            .padding()
//            .datePickerStyle(.graphical)

//        DatePicker("Date:", selection: $selectedDate)
//            .padding()
//            .datePickerStyle(.wheel)

        // 多选
        MultiDatePicker("Dates:", selection: $selectedDates)
            .padding()
            .onChange(of: selectedDates, initial: false) { _, values in
                let days = values.map { value in
                    String(value.day!)
                }
                selectedDateString = days.joined(separator: ",")
            }

        Text(selectedDateString)
    }
}

#Preview {
    DatePickerDemoView()
}
