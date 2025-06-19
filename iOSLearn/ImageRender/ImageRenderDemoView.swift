//
//  ImageRenderDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=90
//
//  视图每次都是重新绘制的
//  当需要 复用图形 或 将器存入文件或数据库时， 可以将视图转换为图像
//  UIImage -> UIKit
//  CGImage -> CoreGraphics
//  NSImage -> AppKit
//
//  Created by kempluo on 2025/6/19.
//

import SwiftUI

struct ImageRenderDemoView: View {
    @State private var pattern: UIImage?
    private let newPic = NewPictureView()

    var body: some View {
        VStack {
            newPic

            Button("Export Image") {
                let render = ImageRenderer(content: newPic)
                if let img = render.uiImage {
                    pattern = img.preparingThumbnail(of: CGSize(width: 30, height: 20))
                }
            }

            if let pattern {
                Rectangle()
                    .fill(.image(Image(uiImage: pattern)))
                    .frame(width: 210, height: 200)
            }

            Spacer()
        }
    }
}

private struct NewPictureView: View {
    var body: some View {
        Image(.toronto)
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 100)
            .clipShape(Circle())
    }
}

#Preview {
    ImageRenderDemoView()
}
