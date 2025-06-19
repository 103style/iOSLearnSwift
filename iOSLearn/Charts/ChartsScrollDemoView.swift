//
//  ChartsScrollDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=89
//  当数据多时可以开启滚动
//
//  Created by kempluo on 2025/6/19.
//

import Charts
import SwiftUI

struct ChartsScrollDemoView: View {
    @Environment(ChartsApplicationData.self) private var appData

    var body: some View {
        VStack {
            Chart {
                ForEach(appData.sales) { product in
                    ForEach(product.sales) { sale in
                        BarMark(x: .value("Date", sale.date, unit: .day), y: .value("Sales", sale.amount))
                    }
                    .foregroundStyle(by: .value("Product", product.name))
                    // 指定不同的条形图显示不同的产品
                    .position(by: .value("Produce", product.name))
                }
            }
            .frame(height: 200)
            // .chartLegend(.hidden) // 隐藏说明
            .chartScrollableAxes(.horizontal) // 水平滚动
            .chartXVisibleDomain(length: 3600 * 24 * 4) // 默认之显示4天的数据
            .padding()
        }
    }
}

#Preview {
    ChartsScrollDemoView()
        .environment(ChartsApplicationData.shared)
}
