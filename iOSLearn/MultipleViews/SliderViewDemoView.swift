//
//  SliderDemoView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/6/11.
//

import SwiftUI

struct SliderViewDemoView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "book.circle") {
                Text("Main Screen")
            }
            .badge(1)

            Tab("Settings", systemImage: "gear") {
                Text("Settings")
            }
            .badge(12)

            // 侧边栏展示的新按钮
            TabSection("More Info") {
                Tab("Additional One", systemImage: "plus") {
                    Text("Additional One")
                }
                Tab("Additional Two", systemImage: "pencil") {
                    Text("Additional Two")
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable) // ipad上 自适应侧边栏
        .tabViewSidebarHeader { // 配置侧边栏顶部UI
            Text("My Menu").padding()
        }
        .tabViewSidebarFooter { // 配置侧边栏底部UI
            Text("My Bottom").padding()
        }
    }
}

#Preview {
    SliderViewDemoView()
}
