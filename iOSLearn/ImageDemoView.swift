//
//  ImageDemoView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/5/19.
//

import SwiftUI

struct ImageDemoView: View {
    @ScaledMetric var customSize = 100
    var body: some View {
        // assets 目录下 创建Toronto资源，并放入目标3个尺寸的图片

 

        Image("Toronto")
//            .resizable() // 充满屏幕  fitXY
//            .clipped() // 裁剪 centerCrop
//            .scaledToFit()
//            .scaledToFill()
//            .aspectRatio(contentMode: .fit)

            // 等比缩放到指定大小能完整显示
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 200, heigh t: 100)

            // 撑满指定大小， 染后裁剪多余的部分
//            .resizable()
//            .scaledToFill()
//            .frame(width: 200, height: 100)
//            .clipped()

            // 添加圆角和阴影
            .resizable()
            .scaledToFit()
            .cornerRadius(25)
            .padding(20)
            .shadow(color: Color.gray, radius: 5, x: 5, y: 5)
            .scaleEffect(CGSize(width: 0.5, height: 0.5)) // 宽高缩小一半
            .blur(radius: 5) // 模糊效果

        // 类似文字的动态大小 来设置图片的宽高
        Image(.toronto)
            .resizable()
            .frame(width: customSize, height: customSize)
        
        Image(.toronto)
            .resizable(
                // 设置图像的 ​​保护区域​​（UIEdgeInsets），定义不受拉伸的边距。
                // 设置保护区域（上、左、下、右各保留 10 点不拉伸）
                capInsets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10),
                // 拉伸模式
                // .tile：平铺重复保护区域外的内容
                // .stretch：拉伸保护区域外的内容
                resizingMode: .stretch
            )
            .frame(width: 200, height: 100)
    }
}

#Preview {
    ImageDemoView()
}
