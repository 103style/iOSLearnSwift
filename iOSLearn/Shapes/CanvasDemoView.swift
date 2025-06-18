//
//  CanvasDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=83
//
//  Canvas 转为动态二维绘制设计
//
//  Created by kempluo on 2025/6/18.
//

import SwiftUI

struct CanvasDemoView: View {
    var body: some View {
        VStack {
            Canvas { context, size in
                // 整屏绘制图片
                let imageFrame = CGRect(origin: .zero, size: size)
                context.draw(Image(.flower), in: imageFrame)
                
                // 在指定区域绘制指定大小的图片
                let imageSize = CGSize(width: 150, height: 200)
                let sizeframe = CGRect(x: 50, y: 90, width: imageSize.width, height: imageSize.height)
                context.draw(Image(.toronto), in: sizeframe)
                
                // 在图片上放添加形状和文字
                let circleFrame = CGRect(x: 30, y: 60, width: 40, height: 40)
                context.fill(Circle().path(in: circleFrame), with: .color(.yellow))
                let capsuleFrame = CGRect(x: 50, y: 65, width: 150, height: 25)
                context.fill(Capsule().path(in: capsuleFrame), with: .color(.yellow))
                
                let textPos = CGPoint(x: 70, y: 78)
                context.draw(Text("toronto").font(.title.bold()), at: textPos, anchor: .leading)
                
                context.fill(Circle().path(in: CGRect(x: -10, y: -10, width: 20, height: 20)), with: .color(.red))
                
                // 旋转画布 旋转点默认是左上角
                context.rotate(by: .degrees(20))
                context.draw(Image(.toronto), in: sizeframe)
                context.rotate(by: .degrees(-20))
                
                // 将原点移动到 屏幕中心点
                context.translateBy(x: size.width/2, y: size.height/2)
                // 在圆心画个红圆
                context.fill(Circle().path(in: CGRect(x: -10, y: -10, width: 20, height: 20)), with: .color(.red))
                
                // 提前解析图片 已提升新能
                let imageReday = context.resolve(Image(.flower))
                // 旋转时累积的
                let rotateImageFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
                for _ in 0 ..< 10 {
                    context.rotate(by: .degrees(36))
                    context.draw(imageReday, in: rotateImageFrame)
                }
                
            }.background(.gray)
        }.padding()
       
        // }.ignoresSafeArea()
    }
}

#Preview {
    CanvasDemoView()
}
