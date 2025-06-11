//
//  TabWithSearchDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi?&p=29
//
//  Created by kempluo on 2025/6/11.
//

import SwiftUI

struct TabWithSearchDemoView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "book.circle") {
                Text("Main Screen")
            }

            Tab("Settings", systemImage: "gear") {
                Text("Settings")
            }

            // iphone ipad 显示会不一样
            Tab(role: .search) {
                Text("Search")
            }
        }
    }
}

#Preview {
    TabWithSearchDemoView()
}
