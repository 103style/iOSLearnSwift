//
//  ChartsOverlayDemoView.swift
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

struct ChartsModifiesDemoView: View {
    @Environment(ChartsApplicationData.self) private var appData

    var body: some View {
        VStack {
            Chart(appData.listOfItems) { item in
                BarMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
            }
            .frame(height: 300)
            .padding()
            // 添加遮罩
            .chartOverlay(content: { proxy in
                GeometryReader { geometry in
                    if let plotFrame = proxy.plotContainerFrame { // 是否有图标
                        let frame = geometry[plotFrame]
                        VStack {
                            Text("My Chart").padding(30)
                        }
                        .background(.ultraThinMaterial, in: Capsule())
                        .position(x: frame.midX, y: frame.midY)
                    }
                }
            })
            // 自定义Y轴刻度单位, 默认是自适应的
            .chartYScale(domain: 0 ... 1000)
            // 样式（线条、符号）、位置（位置、偏移量）、注释（标签、视图）

            // 饼图
            Chart(appData.listOfItems) { item in
                SectorMark(angle: .value("Name", item.calories))
                    .foregroundStyle(by: .value("Product category", item.name))
            }
            .frame(height: 300)
            .padding()
        }
    }
}

#Preview {
    ChartsModifiesDemoView()
        .environment(ChartsApplicationData.shared)
}
