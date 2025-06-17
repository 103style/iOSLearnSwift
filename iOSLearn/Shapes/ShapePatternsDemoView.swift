//
//  ShapePatternsDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=80
//
//  Created by kempluo on 2025/6/17.
//

import SwiftUI

struct ShapePatternsDemoView: View {
    var body: some View {
        Rectangle()
            .fill(.image(Image(.toronto))) // 使用图片作为背景来填满当前视图
    }
}

#Preview {
    ShapePatternsDemoView()
}
