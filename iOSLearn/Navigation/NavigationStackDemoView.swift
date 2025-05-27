//
//  NavigationStackDemoView.swift
//  iOSLearn
//
//  教程：https://www.bilibili.com/video/BV187E3zLEbi/?p=18
//  doc：https://developer.apple.com/documentation/swiftui/navigationstack
//
//  Created by kempluo on 2025/5/27.
//

import SwiftUI

struct NavigationStackDemoView: View {
    @Environment(GroupApplicationData.self) private var shareData

    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in

                List(shareData.books) { book in
                    CellBook(book: book)
                }
                .listStyle(.inset)
                .navigationTitle(Text("Title:Books")) // 导航标题
                .navigationBarTitleDisplayMode(.inline) // 标题直接在中间,  .large则会有单独一行
                .toolbar {
                    // 单个按钮
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // 删除第一个
                            if !shareData.books.isEmpty {
                                shareData.books.removeFirst()
                            }
                        }, label: {
                            Image(systemName: "trash")
                        })
                    }

                    // 添加多个按钮
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(action: {
                            // 回到顶部
                            if let firstIndex = shareData.books.first?.id {
                                proxy.scrollTo(firstIndex, anchor: .bottom)
                            }
                        }, label: {
                            Image(systemName: "arrowshape.up")
                        })
                        Button(action: {
                            // 跳转底部
                            if let lastIndex = shareData.books.last?.id {
                                proxy.scrollTo(lastIndex, anchor: .bottom)
                            }
                        }, label: {
                            Image(systemName: "arrowshape.down")
                        })
                    }
                }
//                .toolbar(.hidden, for: .navigationBar) // 隐藏指定导航栏， 顶部
//                .toolbar(.hidden, for: .bottomBar) // 隐藏指定导航栏， 底部
                .toolbar {
                    // 底部导航栏
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Button(action: {
                                // 回到顶部
                                if let firstIndex = shareData.books.first?.id {
                                    proxy.scrollTo(firstIndex, anchor: .bottom)
                                }
                            }, label: {
                                Image(systemName: "arrowshape.up")
                            })
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStackDemoView()
        .environment(GroupApplicationData.shared)
}
