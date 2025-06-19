//
//  AnimationCreateDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=93
//  实现圆半径变化的动画
//
//  Created by kempluo on 2025/6/19.
//

import SwiftUI

private class CircleData {
    var radius: CGFloat = 0
    var step: CGFloat = 5
    var lastTime: Double = 0
    var maxTime: Double = 0.02
}

struct AnimationCreateDemoView: View {
    private let circleData = CircleData()

    var body: some View {
        TimelineView(.animation) { time in
            let interval = time.date.timeIntervalSinceReferenceDate
            let delta = interval - circleData.lastTime

            Canvas { context, size in
                // 每 0.02s 更新下半径
                if delta > circleData.maxTime {
                    calculateRadius()
                    circleData.lastTime = interval
                }
                let rad = circleData.radius
                let circleFrame = CGRect(x: size.width / 2 - rad, y: size.height / 2 - rad, width: rad * 2, height: rad * 2)
                context.fill(Circle().path(in: circleFrame), with: .color(.red))
            }
        }.ignoresSafeArea()
    }

    private func calculateRadius() {
        circleData.radius = circleData.radius + circleData.step
        if circleData.radius < 0 && circleData.step < 0 {
            circleData.step = 5
            circleData.radius = 0
        }
        if circleData.radius > 150 && circleData.step > 0 {
            circleData.step = -5
            circleData.radius = 150
        }
    }
}

#Preview {
    AnimationCreateDemoView()
}
