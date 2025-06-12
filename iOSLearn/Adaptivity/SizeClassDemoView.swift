//
//  SizeClassDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=33
//
//  Created by kempluo on 2025/6/12.
//

import SwiftUI

struct SizeClassDemoView: View {
    @Environment(\.horizontalSizeClass) var horizontalClass

    var body: some View {
        Group {
            // .compact​​：表示水平方向上的紧凑尺寸。通常对应于 iPhone 在竖屏模式下的水平尺寸
            // ​​.regular​​​：表示水平方向上的常规尺寸。通常对应于 iPad 在横屏模式下的水平尺寸
            // nil​​：在极少数情况下可能为 nil，但通常我们可以忽略 nil 的情况，因为它在正常设备上总是有值的。
            if horizontalClass == .compact { // 竖屏
                VStack(spacing: 0) {
                    HeaderView(isCompact: true)
                    BodyView()
                }
            } else {
                HStack(spacing: 0) { // 横屏
                    HeaderView(isCompact: false)
                    BodyView()
                }
            }
        }
    }
}

private struct HeaderView: View {
    let isCompact: Bool
    var body: some View {
        Text("Header")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: isCompact ? 150 : .infinity)
            .background(.yellow)
    }
}

private struct BodyView: View {
    var body: some View {
        Text("Content")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(.gray)
    }
}

#Preview {
    SizeClassDemoView()
}
