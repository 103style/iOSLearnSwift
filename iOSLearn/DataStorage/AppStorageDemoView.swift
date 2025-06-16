//
//  AppStorageDemoView.swift
//  iOSLearn
//
//  数据持久化
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=49
//
//
//  Created by kempluo on 2025/6/16.
//

import SwiftUI

struct AppStorageDemoView: View {
    // 保存在用户默认系统中， 重启应用还是最后显示的值
    @AppStorage("counter") var counter: Double = 0

    // 距离上次启动多久
    @AppStorage("intercal") var interval = Date.timeIntervalSinceReferenceDate
    @State private var message: String = ""

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Stepper("", value: $counter).labelsHidden()

                Text("\(counter.formatted(.number.precision(.fractionLength(0))))")
                    .font(.title)
            }

            HStack {
                Text("\(message)")
                    .lineLimit(nil)
                    .padding()
            }.onAppear {
                let calendar = Calendar.current
                let lastDate = Date(timeIntervalSinceReferenceDate: interval)
                let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: lastDate, to: Date())
                message = "You have't use this app in \(components.year!) years, \(components.month!) months, \(components.day!) days, \(components.hour!) hours, \(components.minute!) minutes, \(components.second!) seconds"
                interval = Date.timeIntervalSinceReferenceDate
            }
        }
    }
}

#Preview {
    AppStorageDemoView()
}
