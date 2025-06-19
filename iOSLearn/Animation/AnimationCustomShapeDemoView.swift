//
//  AnimationCustomShapeDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=92
//  对自定义的形状怎么动画
//  主要是根据 animatableData值的变化 改变属性值， 重绘视图
//
//  Created by kempluo on 2025/6/19.
//

import SwiftUI

struct AnimationCustomShapeDemoView: View {
    @State private var simling: Bool = true

    var body: some View {
        VStack {
            Face(smile: simling ? 1 : 0)
                .stroke(Color.blue, lineWidth: 5)
                .frame(width: 100, height: 120)

            Button("Change") {
                withAnimation(.linear(duration: 2)) {
                    simling.toggle()
                }
            }
        }
    }
}

private struct Face: Shape {
    var smile: CGFloat

    var animatableData: CGFloat {
        get {
            return smile
        }
        set {
            smile = newValue
        }
    }

    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let smileClamp = min(max(smile, 0), 1)
        let section = rect.height / 5
        let smilePos = section + (section * 3 * smileClamp)

        // 确定表情的几个位置点
        let eyeWH: CGFloat = 20
        let eyePosY = rect.minY + eyeWH / 2
        let leftEyePosX = width / 10 * 2
        let rightEyePosX = width / 10 * 8

        var path = Path()
        // 两个眼睛
        path.addEllipse(in: CGRect(x: leftEyePosX - eyeWH / 2, y: eyePosY, width: eyeWH, height: eyeWH))
        path.addEllipse(in: CGRect(x: rightEyePosX - eyeWH / 2, y: eyePosY, width: eyeWH, height: eyeWH))

        // 通过控制 smilePos的变化 来改变笑脸
        path.move(to: CGPoint(x: leftEyePosX, y: rect.midY))
        path.addCurve(to: CGPoint(x: rightEyePosX, y: rect.midY), control1: CGPoint(x: width / 4, y: smilePos), control2: CGPoint(x: width / 4 * 3, y: smilePos))
        return path
    }
}

#Preview {
    AnimationCustomShapeDemoView()
}
