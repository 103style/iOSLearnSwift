//
//  ChartsDotMarkDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=84
//
//  点图、矩形图、区域图、饼图
//
//  Created by kempluo on 2025/6/18.
//

import Charts
import SwiftUI

struct ChartsOtherMarkDemoView: View {
    @Environment(ChartsApplicationData.self) private var appData

    var body: some View {
        VStack {
            // 点图
            Chart(appData.listOfItems) { item in
                PointMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
            }.frame(height: 150)

            // 矩形图
            Chart(appData.listOfItems) { item in
                RectangleMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
            }.frame(height: 150)

            // 区域图
            Chart(appData.listOfItems) { item in
                AreaMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
            }.frame(height: 150)

            // 饼图
            Chart(appData.listOfItems) { item in
                SectorMark(angle: .value("Calories", item.calories))
                    .foregroundStyle(by: .value("Product Name", item.name))
            }
            .frame(height: 150)
        }
    }
}

#Preview {
    ChartsOtherMarkDemoView()
        .environment(ChartsApplicationData.shared)
}
