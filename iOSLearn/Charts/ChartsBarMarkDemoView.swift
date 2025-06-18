//
//  ChartsDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=84
//
//  条形图
//
//  Created by kempluo on 2025/6/18.
//

import Charts
import SwiftUI

struct ChartsBarMarkDemoView: View {
    @Environment(ChartsApplicationData.self) private var appData

    var body: some View {
        VStack {
            Chart(appData.listOfItems) { item in
                BarMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
            }.frame(height: 300)
                .padding()

            Chart(appData.listOfItems) { item in
                BarMark(x: .value("Calories", item.calories), y: .value("Name", item.name))
            }.frame(height: 300)
                .padding()

            Spacer()
        }
    }
}

#Preview {
    ChartsBarMarkDemoView()
        .environment(ChartsApplicationData.shared)
}
