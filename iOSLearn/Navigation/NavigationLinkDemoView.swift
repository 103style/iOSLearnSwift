//
//  NavigationLinkDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi/?p=20
//  文档：https://developer.apple.com/documentation/swiftui/NavigationLink
//
//  Created by kempluo on 2025/6/10.
//

import SwiftUI

struct NavigationLinkDemoView: View {
    @Environment(GroupApplicationData.self) private var shareData

    private var settingText = "Setting View"

    @State private var viewPath = NavigationPath()

    var body: some View {
        @Bindable var appData = shareData
        // 直接设置跳转页面
//        NavigationStack {
//            List(shareData.filterBooks) { book in
//                NavigationLink(destination: {
//                    CellBookDetailView(book: book)
//                }, label: {
//                    CellBook(book: book)
//                })
//            }
//            .listStyle(.inset)
//            .navigationTitle(Text("Books"))
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    // 跳转二级页面
//                    NavigationLink(destination: {
//                        SettingView()
//                    }, label: {
//                        Image(systemName: "gearshape")
//                    })
//                }
//            }
//        }

        // 设置跳转页面的值， 然后通过 navigationDestination匹配值来跳转对应的页面
        NavigationStack(path: $appData.viewPath) { // path 配置统一管理的导航链接
            List(shareData.filterBooks) { book in
                NavigationLink(value: book, label: {
                    CellBook(book: book)
                })
            }
            .listStyle(.inset)
            .navigationTitle(Text("Books"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(value: settingText, label: {
                        Image(systemName: "gearshape")
                    })
                }
            }
            .navigationDestination(for: Book.self) { book in
//                CellBookDetailView(viewPath: $viewPath, book: book)
                CellBookDetailView(book: book)
            }
            .navigationDestination(for: String.self, destination: { viewId in
                if viewId == settingText {
//                    SettingView(viewPath:$viewPath)
                    SettingView()
                }
            })
        }
    }
}

#Preview {
    NavigationLinkDemoView()
        .environment(GroupApplicationData.shared)
}
