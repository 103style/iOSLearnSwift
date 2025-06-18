//
//  CanvasMultiLayerDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=83
//
//  画布不同配置
//
//  Created by kempluo on 2025/6/18.
//

import SwiftUI

struct CanvasMultiLayerDemoView: View {
    var body: some View {
        VStack {
            Canvas { context, size in
                
                // 这里看起来是完全copy的
                var copyContext = context
                copyContext.translateBy(x: size.width / 2, y: size.height / 2)
                copyContext.rotate(by: .degrees(45))
                let imageFrame = CGRect(x: -50, y: -75, width: 100, height: 150)
                copyContext.draw(Image(.toronto), in: imageFrame)

                let centerX = size.width / 2
                let rectFrame = CGRect(x: centerX - 120, y: 160, width: 250, height: 40)
                context.fill(RoundedRectangle(cornerRadius: 25).path(in: rectFrame), with: .color(.yellow))
                let textPos = CGPoint(x: centerX, y: 180)
                context.draw(Text("picture"), at: textPos, anchor: .center)

            }.background(.gray)
        }.padding()
    }
}

#Preview {
    CanvasMultiLayerDemoView()
}
