//
//  GradientDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=77
//  颜色渐变
//
//  Created by kempluo on 2025/6/17.
//

import SwiftUI

struct GradientDemoView: View {
    private let gradient = Gradient(colors: [.red, .green])

    // 控制渐变色的开始位置
    private let gradientWithPosition = Gradient(stops: [
        Gradient.Stop(color: .red, location: 0.0),
        Gradient.Stop(color: .blue, location: 0.6),
    ])

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.linearGradient(gradient, startPoint: .bottom, endPoint: .top)) // 从下到上的线性渐变
            .frame(width: 100, height: 100)

        RoundedRectangle(cornerRadius: 20)
            .fill(.linearGradient(gradientWithPosition, startPoint: .bottom, endPoint: .top)) // 从下到上的线性渐变
            .frame(width: 100, height: 100)

        RoundedRectangle(cornerRadius: 20)
            .fill(.radialGradient(gradient, center: .center, startRadius: 0, endRadius: 60)) // 镜像渐变
            .frame(width: 100, height: 100)

        RoundedRectangle(cornerRadius: 20)
            .fill(.conicGradient(gradient, center: .center, angle: .degrees(0))) // 圆锥渐变 angle：渐变起始点
            .frame(width: 100, height: 100)

        // 网格渐变
        MeshGradient(width: 3, height: 3, points: [
            [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
            [0.0, 0.5], [0.8, 0.8], [1.0, 0.6],
            [0.0, 1.0], [0.5, 1.0], [1.0, 1.0],
        ], colors: [
            .red, .purple, .indigo,
            .orange, .white, .blue,
            .yellow, .green, .mint,
        ])
    }
}

#Preview {
    GradientDemoView()
}
