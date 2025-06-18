//
//  ChartsLineMarkDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=84
//
//  折线图
//
//  Created by kempluo on 2025/6/18.
//

import Charts
import SwiftUI

struct ChartsLineMarkDemoView: View {
    @Environment(ChartsApplicationData.self) private var appData

    var body: some View {
        VStack {
            Chart(appData.listOfItems) { item in
                // 折线图
                LineMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
            }
            .frame(height: 300)
            .padding()
        }
    }
}

#Preview {
    ChartsLineMarkDemoView()
        .environment(ChartsApplicationData.shared)
}
