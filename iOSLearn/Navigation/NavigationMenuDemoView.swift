//
//  NavigationMenuDemoView.swift
//  iOSLearn
//
//  Created by kempluo on 2025/5/27.
//

import SwiftUI

struct NavigationMenuDemoView: View {
    @Environment(GroupApplicationData.self) private var shareData

    var body: some View {
        NavigationStack {
            List {}
                .navigationTitle(Text("Books"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar { // 添加菜单
                    Menu(content: {
                        Button("Option 1") { print("1") }
                        Button("Option 2") { print("2") }
                        Button("Option 3") { print("3") }
                    }, label: {
                        Image(systemName: "slider.horizontal.3")
                    })
                }
        }
    }
}

#Preview {
    NavigationMenuDemoView()
        .environment(GroupApplicationData.shared)
}
