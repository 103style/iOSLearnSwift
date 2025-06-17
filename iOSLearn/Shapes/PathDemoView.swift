//
//  PathDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=80
//
//  手动绘制各类图形
//
//  Created by kempluo on 2025/6/17.
//

import SwiftUI

struct PathDemoView: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 100, y: 150))
                path.addLine(to: CGPoint(x: 200, y: 150))
                //            path.addLine(to: CGPoint(x: 100, y: 250))
                // 在 100，250的位置添加一个园弧
                path.addArc(center: CGPoint(x: 100, y: 250), radius: 20, startAngle: .degrees(270), endAngle: .degrees(90), clockwise: false)
                // 在190，140的位置添加一个椭圆
                path.addEllipse(in: CGRect(x: 180, y: 140, width: 40, height: 20)) // 添加一个

                // 添加贝塞尔曲线
                path.move(to: CGPoint(x: 200, y: 200))
                // 二阶
                path.addQuadCurve(to: CGPoint(x: 300, y: 300), control: CGPoint(x: 200, y: 300))

                path.move(to: CGPoint(x: 200, y: 300))
                // 三阶
                path.addCurve(to: CGPoint(x: 100, y: 400), control1: CGPoint(x: 200, y: 400), control2: CGPoint(x: 300, y: 500))
                path.closeSubpath()
            }
            .stroke(.blue, lineWidth: 2)

            GeometryReader { geometry in
                Path { path in
                    let w = geometry.size.width / 2
                    let h = geometry.size.height / 2
                    let posX = (geometry.size.width - w) / 2
                    let posY = (geometry.size.height - h) / 2

                    path.move(to: CGPoint(x: posX, y: posY))
                    path.addLine(to: CGPoint(x: posX + w, y: posY))
                    path.addLine(to: CGPoint(x: posX, y: posY + h))
                    path.closeSubpath()
                }
                .stroke(.red, lineWidth: 2)
            }
        }
    }
}

#Preview {
    PathDemoView()
}
