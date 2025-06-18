//
//  ChartsWithDiffMarksDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=85
//
//  图标修饰符
//
//  Created by kempluo on 2025/6/18.
//

import Charts
import SwiftUI

struct ChartsWithDiffMarksDemoView: View {
    @Environment(ChartsApplicationData.self) private var appData

    var body: some View {
        VStack {
            Chart(appData.listOfItems) { item in

                LineMark(x: .value("Name", item.name), y: .value("Calories", item.calories))

                PointMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
                    .foregroundStyle(by: .value("Category", item.category)) // 按分类区分样式
                    .symbol(by: .value("Category", item.category))
                    .symbolSize(100)

                // 添加平均值
                RuleMark(y: .value("Average", averageCalories()))
                    .foregroundStyle(.black)
                    .lineStyle(StrokeStyle(lineWidth: 2))
                    .annotation(position: .top, alignment: .leading) {
                        Text("Avg")
                    }
            }
            .frame(height: 300)
            .padding()
        }
    }

    private func averageCalories() -> Int {
        let total = appData.listOfItems.reduce(0) { $0 + $1.calories }
        return total / appData.listOfItems.count
    }
}

#Preview {
    ChartsWithDiffMarksDemoView()
        .environment(ChartsApplicationData.shared)
}
