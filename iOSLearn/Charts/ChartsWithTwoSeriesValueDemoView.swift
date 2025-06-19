//
//  ChartsWithTwoSeriesValueDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=88
//  显示多组数据，配置不同的颜色、位置
//
//  Created by kempluo on 2025/6/19.
//

import Charts
import SwiftUI

struct ChartsWithTwoSeriesValueDemoView: View {
    @Environment(ChartsApplicationData.self) private var appData

    var body: some View {
        VStack {
            Chart {
                ForEach(appData.sales) { product in
                    ForEach(product.sales) { sale in
                        LineMark(x: .value("Date", sale.date, unit: .day), y: .value("Sales", sale.amount))
                    }
                    .foregroundStyle(by: .value("Product", product.name))
                }
            }
            .frame(height: 200)
            .padding()

            Chart {
                ForEach(appData.sales) { product in
                    ForEach(product.sales) { sale in
                        BarMark(x: .value("Date", sale.date, unit: .day), y: .value("Sales", sale.amount))
                    }
                    .foregroundStyle(by: .value("Product", product.name))
                }
            }
            // 配置条形图的颜色
            .chartForegroundStyleScale([
                "Bagels": .red,
                "Brownies": .orange
            ])
            .frame(height: 200)
            .padding()

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
            .padding()
        }
    }
}

#Preview {
    ChartsWithTwoSeriesValueDemoView()
        .environment(ChartsApplicationData.shared)
}
