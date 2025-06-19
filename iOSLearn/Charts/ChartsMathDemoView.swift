//
//  ChartsMathDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=87
//  绘制数学函数
//
//  Created by kempluo on 2025/6/19.
//

import Charts
import SwiftUI

struct ChartsMathDemoView: View {
    @Environment(ChartsApplicationData.self) private var appData

    var body: some View {
        VStack {
            Chart {
                LinePlot(x: "x", y: "y") { x in
                    sin(x)
                }
            }
            .chartXScale(domain: -5...5)
            .chartYScale(domain: -5...5)
            .frame(height: 200)
            .padding()

            Chart {
                LinePlot(x: "x", y: "y") { x in
                    cos(x)
                }
            }
            .chartXScale(domain: -5...5)
            .chartYScale(domain: -5...5)
            .frame(height: 200)
            .padding()
        }
    }
}

#Preview {
    ChartsMathDemoView()
        .environment(ChartsApplicationData.shared)
}
