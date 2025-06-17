//
//  ShapeEffectsDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=78
//
//  Created by kempluo on 2025/6/17.
//

import SwiftUI

struct ShapeEffectsDemoView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(.shadow(.drop(color: .black, radius: 3, x: 4, y: 4))) // 阴影
            .foregroundColor(.red)
            .frame(width: 100, height: 100)
    }
}

#Preview {
    ShapeEffectsDemoView()
}
