//
//  ChartsWithSelcetionDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=86
//
//  点击、滑动 查看选中的图表项
//
//  Created by kempluo on 2025/6/19.
//

import Charts
import SwiftUI

struct ChartsWithSelcetionDemoView: View {
    @Environment(ChartsApplicationData.self) private var appData
    @State private var selectedFood: String? = nil

    var body: some View {
        VStack {
            Chart(appData.listOfItems) { item in
                BarMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
                    .foregroundStyle(item.name == selectedFood ? .yellow : .blue)
            }
            .frame(height: 300)
            .padding()
            .chartXSelection(value: $selectedFood)
            
            
            
        }
    }
}

#Preview {
    ChartsWithSelcetionDemoView()
        .environment(ChartsApplicationData.shared)
}
