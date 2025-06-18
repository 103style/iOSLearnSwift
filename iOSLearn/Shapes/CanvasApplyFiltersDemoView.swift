//
//  CanvasApplyFiltersDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=83
//
//  配置滤镜
//
//  Created by kempluo on 2025/6/18.
//

import SwiftUI

struct CanvasApplyFiltersDemoView: View {
    var body: some View {
        VStack {
            Canvas { context, size in
                // 添加颜色
                context.addFilter(.colorMultiply(.red))
                // 模糊
                context.addFilter(.blur(radius: 5))

                let image = context.resolve(Image(.flower))

                let w: Double = 200
                let h: Double = 200
                let margin = (size.width - w) / 2
                let imageFrame = CGRect(x: margin, y: margin, width: w, height: h)
                context.draw(image, in: imageFrame)

            }.background(.gray)
        }.padding()
    }
}

#Preview {
    CanvasApplyFiltersDemoView()
}
