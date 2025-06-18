//
//  CanvasDrawImageDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=83
//
//  使用 context.resolve(Image(.flower)) 提前解析图片已提升性能
//
//  Created by kempluo on 2025/6/18.
//

import SwiftUI

struct CanvasBestDrawImageDemoView: View {
    var body: some View {
        VStack {
            Canvas { context, size in
                // 提前解析图片 已提升新能
                let imageReday = context.resolve(Image(.flower))

                // 将原点移动到 屏幕中心点
                context.translateBy(x: size.width/2, y: size.height/2)
                // 在圆心画个红圆
                context.fill(Circle().path(in: CGRect(x: -10, y: -10, width: 20, height: 20)), with: .color(.white))

                // 旋转时累积的
                let rotateImageFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
                for _ in 0 ..< 10 {
                    context.rotate(by: .degrees(36))
                    context.draw(imageReday, in: rotateImageFrame)
                }

            }.background(.gray)
        }.padding()
    }
}

#Preview {
    CanvasBestDrawImageDemoView()
}
