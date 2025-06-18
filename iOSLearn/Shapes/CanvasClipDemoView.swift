//
//  CanvasClipDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=83
//
//  画布裁剪示例
//
//  Created by kempluo on 2025/6/18.
//

import SwiftUI

struct CanvasClipDemoView: View {
    var body: some View {
        VStack {
            Canvas { context, size in
                // 提前解析图片 已提升新能
                let imageReday = context.resolve(Image(.flower))

                context.translateBy(x: size.width/2, y: size.height/2)

                // 裁剪画布 为半径是200的圆
                let clipFrame = CGRect(x: -100, y: -100, width: 200, height: 200)
                context.clip(to: Circle().path(in: clipFrame))

                context.fill(Circle().path(in: CGRect(x: -10, y: -10, width: 20, height: 20)), with: .color(.white))

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
    CanvasClipDemoView()
}
