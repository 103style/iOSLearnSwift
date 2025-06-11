//
//  TabViewDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?p=28
//  doc: https://developer.apple.com/documentation/swiftui/tabview
//
//  Created by kempluo on 2025/6/11.
//

import SwiftUI

struct TabViewDemoView: View {
    @State private var selectedView: Int = 2

    var body: some View {
        // iphone显示在底部， ipad显示在顶部
        TabView(selection: $selectedView) { // 配置默认显示的视图
            Tab("Home", systemImage: "book.circle", value: 1) {
                Text("Main Screen")
            }
            .badge(1)

            Tab("Settings", systemImage: "gear", value: 2) {
                Text("Settings")
            }
            .badge(12)
        }
    }
}

#Preview {
    TabViewDemoView()
}
