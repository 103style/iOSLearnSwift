//
//  AnimationDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=91
//
//  动画简单示例
//
//  Created by kempluo on 2025/6/19.
//

import SwiftUI

struct AnimationSimpleDemoView: View {
    @State private var boxScale: CGFloat = 1
    @State private var boxScale2: CGFloat = 1
    @State private var boxScale3: CGFloat = 1

    @State private var change: Bool = false

    @State private var roundCorners: Bool = false

    var body: some View {
        VStack(spacing: 32) {
            Text("Scale Animation")

            HStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 50, height: 50)
                    .scaleEffect(boxScale)
            }

            HStack(spacing: 16) {
                Button("default") {
                    change.toggle()
                    withAnimation(.default) {
                        boxScale = getScaleValue()
                    }
                }
                Button("linear") {
                    change.toggle()
                    withAnimation(.linear(duration: 3)) { // 3s
                        boxScale = getScaleValue()
                    }
                }

                Button("bouncy") {
                    change.toggle()
                    // 时长1.5s 延迟1s启动 2倍速度  重复3次
                    withAnimation(.bouncy(duration: 1.5).delay(1).speed(2).repeatCount(3)) {
                        boxScale = getScaleValue()
                    }
                }
            }

            Text("自定义弹簧动画")

            HStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 50, height: 50)
                    .scaleEffect(boxScale2)
            }
            Button("Start Anim") {
                change.toggle()
                let animation = Animation.interpolatingSpring(mass: 0.15, stiffness: 0.8, damping: 0.5, initialVelocity: 5)
                    .speed(5)
                    .repeatForever()

                withAnimation(animation) {
                    boxScale2 = getScaleValue()
                }
            }

            Text("放缩 + 圆角变化")

            HStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 50, height: 50)
                    .cornerRadius(roundCorners ? 15 : 0)
                    .scaleEffect(boxScale3)
            }
            Button("Start Anim") {
                change.toggle()

                // 1. 放缩线形  圆角渐入渐出
//                withAnimation(.easeInOut) {
//                    roundCorners = getScaleValue() == 2
//                }
//                withAnimation(.linear) {
//                    boxScale3 = getScaleValue()
//                }

                // 2. 放缩、圆角 都 渐入渐出
                withAnimation(.easeInOut(duration: 2).repeatForever()) {
                    roundCorners = getScaleValue() == 2
                    boxScale3 = getScaleValue()
                }
            }
        }
    }

    private func getScaleValue() -> CGFloat {
        if change {
            return 2
        } else {
            return 1
        }
    }
}

#Preview {
    AnimationSimpleDemoView()
}
